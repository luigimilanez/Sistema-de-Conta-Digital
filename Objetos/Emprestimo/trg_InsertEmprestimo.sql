-- Trigger da tabela Emprestimo
CREATE OR ALTER TRIGGER trg_Emprestimo ON Emprestimo AFTER INSERT, UPDATE AS
BEGIN
    -- Verificar se a conta está ativa
    IF EXISTS (
        SELECT 1 FROM inserted i
        INNER JOIN Conta c ON i.id_conta = c.id_conta
        INNER JOIN Cliente cl ON c.id_cliente = cl.id_cliente
        WHERE cl.ativo = 0
    )
    BEGIN
        RAISERROR('A conta está inativa. Operação de empréstimo não permitida.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END

    -- Verificar se há saldo no limite de empréstimo na conta do usuário
    IF EXISTS (
        SELECT 1 FROM inserted i
        INNER JOIN Conta c ON i.id_conta = c.id_conta
        WHERE c.lim_emprest < i.valor_emprest
    )
    BEGIN
        RAISERROR('A conta não possui saldo suficiente no limite de empréstimo.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END

    -- Verificar se o saldo_real da conta é maior ou igual a 0
    IF EXISTS (
        SELECT 1 FROM inserted i
        INNER JOIN Conta c ON i.id_conta = c.id_conta
        WHERE c.saldo_real < 0
    )
    BEGIN
        RAISERROR('A conta possui saldo negativo. Operação de empréstimo não permitida.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END

    -- Armazenar valores necessários em variáveis
    DECLARE @id_emprest int
    DECLARE @id_conta int
    DECLARE @valor_emprest numeric(14, 2)
    DECLARE @taxa_juros numeric(14, 2)
    DECLARE @data_venc datetime
    SELECT @id_emprest = i.id_emprest,
           @id_conta = i.id_conta,
           @valor_emprest = i.valor_emprest,
           @taxa_juros = i.taxa_juros,
           @data_venc = i.data_venc
    FROM inserted i

    -- Calcular o saldo devedor considerando a taxa de juros e a diferença de minutos
    DECLARE @saldo_devedor numeric(14, 2)
    SET @saldo_devedor = @valor_emprest * POWER((1 + @taxa_juros / 100), DATEDIFF(MINUTE, GETDATE(), @data_venc))

    -- Atualizar o saldo_devedor na tabela Emprestimo
    UPDATE e
    SET e.saldo_devedor = @saldo_devedor
    FROM Emprestimo e
    INNER JOIN inserted i ON e.id_emprest = i.id_emprest

    -- Atualizar o limite de empréstimo na conta do usuário
    UPDATE c
    SET c.lim_emprest = c.lim_emprest - @valor_emprest
    FROM Conta c
    INNER JOIN inserted i ON c.id_conta = i.id_conta

    -- Desativar empréstimos vencidos
    UPDATE e
    SET e.ativo = 0
    FROM Emprestimo e
    WHERE e.data_venc < GETDATE()

    -- Verificar se há empréstimos vencidos
    IF EXISTS (
        SELECT 1 FROM Emprestimo
        WHERE data_venc < GETDATE()
    )
    BEGIN
        -- Mover empréstimos vencidos para a tabela Emprestimodesativado (apenas se ainda não estiverem na tabela)
        INSERT INTO Emprestimodesativado (id_emprest)
        SELECT e.id_emprest
        FROM Emprestimo e
        LEFT JOIN Emprestimodesativado ed ON e.id_emprest = ed.id_emprest
        WHERE e.data_venc < GETDATE()
            AND ed.id_emprest IS NULL
    END
END;