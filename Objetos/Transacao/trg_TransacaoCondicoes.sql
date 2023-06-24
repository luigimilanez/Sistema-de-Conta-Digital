-- Trigger da tabela Transacao
CREATE OR ALTER TRIGGER trg_TransacaoCondicoes ON [Transacao] AFTER INSERT AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @IdContaPagador INT;
    DECLARE @IdClienteBeneficiario INT;
    DECLARE @TipoTransacao VARCHAR(64);
    DECLARE @ValorTransacao NUMERIC(14,2);
    DECLARE @SaldoPagador NUMERIC(14,2);
    
    SELECT @IdContaPagador = i.id_conta,
           @IdClienteBeneficiario = i.id_cliente,
           @TipoTransacao = i.tp_trans,
           @ValorTransacao = i.valor
    FROM inserted i;
    
    -- Verificar se a conta pagadora ou beneficiária está ativa
    IF (SELECT ativo FROM Cliente WHERE id_cliente = @IdContaPagador) = 0 OR (SELECT ativo FROM [Cliente] WHERE id_cliente = @IdClienteBeneficiario) = 0
    BEGIN
        UPDATE Transacao
        SET status = 'Reprovado'
        WHERE id_trans = (SELECT id_trans FROM inserted);
        
        RAISERROR('A conta pagadora ou beneficiária não está ativa. A transação foi reprovada.', 16, 1);
        --ROLLBACK;
        RETURN;
    END;
    
    -- Verificar saldo e efetuar transferência
    IF @TipoTransacao IN ('PIX', 'Transferencia', 'Debito')
    BEGIN
        -- Verificar saldo do pagador
        SELECT @SaldoPagador = saldo_real
        FROM Conta
        WHERE id_conta = @IdContaPagador;
        
        IF @ValorTransacao > @SaldoPagador
        BEGIN
            -- Valor da transação é maior do que o saldo do pagador, reprovar a transação
            UPDATE Transacao
            SET status = 'Reprovado'
            WHERE id_trans = (SELECT id_trans FROM inserted);
            
            RAISERROR('Saldo insuficiente na conta do pagador. A transação foi reprovada.', 16, 1);
            --ROLLBACK;
            RETURN;
        END;
        
        -- Descontar saldo do pagador
        UPDATE Conta
        SET saldo_real = saldo_real - @ValorTransacao
        WHERE id_conta = @IdContaPagador;
        
        -- Incrementar saldo do beneficiário
        UPDATE Conta
        SET saldo_real = saldo_real + @ValorTransacao
        WHERE id_conta = @IdClienteBeneficiario;
        
        -- Atualizar status da transação
        UPDATE Transacao
        SET status = 'Aprovado'
        WHERE id_trans = (SELECT id_trans FROM inserted);
    END;
    
    -- Realizar operação de Depósito
    IF @TipoTransacao = 'Deposito'
    BEGIN
        -- Incrementar saldo do beneficiário
        UPDATE Conta
        SET saldo_real = saldo_real + @ValorTransacao
        WHERE id_conta = @IdClienteBeneficiario;
        
        -- Atualizar status da transação
        UPDATE Transacao
        SET status = 'Aprovado'
        WHERE id_trans = (SELECT id_trans FROM inserted);
    END;

    -- Realizar operação de Crédito
    IF @TipoTransacao = 'Credito'
    BEGIN
        DECLARE @LimiteCredito NUMERIC(14,2);
        
        SELECT @LimiteCredito = lim_credito
        FROM Conta
        WHERE id_conta = @IdContaPagador;
        
        IF @LimiteCredito >= @ValorTransacao
        BEGIN
            -- Incrementar saldo do beneficiário
            UPDATE Conta
            SET saldo_real = saldo_real + @ValorTransacao
            WHERE id_conta = @IdClienteBeneficiario;
            
            -- Reduzir limite de crédito do pagador
            UPDATE Conta
            SET lim_credito = lim_credito - @ValorTransacao
            WHERE id_conta = @IdContaPagador;
            
            -- Atualizar status da transação
            UPDATE Transacao
            SET status = 'Aprovado'
            WHERE id_trans = (SELECT id_trans FROM inserted);
        END
        ELSE
        BEGIN
            -- Limite de crédito insuficiente, reprovar a transação
            UPDATE Transacao
            SET status = 'Reprovado'
            WHERE id_trans = (SELECT id_trans FROM inserted);
            
            RAISERROR('Limite de crédito insuficiente na conta do pagador. A transação foi reprovada.', 16, 1);
            --ROLLBACK;
            RETURN;
        END;
    END;

    -- Verificar se há uma fatura ativa
    IF @TipoTransacao NOT IN ('Debito', 'PIX', 'Deposito', 'Transferencia')
    BEGIN
        DECLARE @IdFatura INT;
        
        SELECT @IdFatura = id_fatura
        FROM Fatura
        WHERE id_conta = @IdContaPagador
        AND ativo = 1;
        
        IF @IdFatura IS NOT NULL
        BEGIN
            -- Adicionar valor da transação à fatura ativa
            UPDATE Fatura
            SET valor = valor + @ValorTransacao
            WHERE id_fatura = @IdFatura;
        END
        ELSE
        BEGIN
            -- Criar nova fatura com o valor da transação
            INSERT INTO Fatura (ativo, id_conta, valor, valor_emprest, dt_venc)
            VALUES (1, @IdContaPagador, @ValorTransacao, 0, GETDATE());
        END;
    END;
END;