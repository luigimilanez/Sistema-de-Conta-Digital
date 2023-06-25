-- Trigger da tabela Investimento
CREATE OR ALTER TRIGGER trg_Investimento ON [Investimento] AFTER UPDATE, INSERT AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar se a conta está ativa para realizar a operação
    IF EXISTS (
        SELECT 1
        FROM [inserted] i
        INNER JOIN [Cliente] cl ON i.id_conta = cl.id_cliente
        WHERE i.ativo = 1 AND cl.ativo = 0
    )
    BEGIN
        -- Lançar erro e abortar a atualização
        RAISERROR('Não é possível realizar o investimento em uma conta desativada.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END
    
    -- Verificar se o investimento está sendo desativado
    IF EXISTS (SELECT 1 FROM [inserted] WHERE ativo = 0)
    BEGIN
        -- Atualizar o saldo da conta com o valor rendido
        UPDATE c
        SET c.saldo_real = c.saldo_real + i.vlr_rendimento
        FROM [Conta] c
        INNER JOIN [Investimento] i ON c.id_conta = i.id_conta
        INNER JOIN [deleted] d ON i.id_invest = d.id_invest
        WHERE d.ativo = 1 AND i.ativo = 0
        
        RETURN
    END
    
    -- Verificar se há saldo suficiente para o investimento
    IF EXISTS (
        SELECT 1
        FROM [inserted] i
        INNER JOIN [Conta] c ON i.id_conta = c.id_conta
        WHERE i.ativo = 1 AND c.saldo_real < i.vlr_investido
    )
    BEGIN
        -- Lançar erro e abortar a atualização
        RAISERROR('Não há saldo suficiente na conta para realizar o investimento.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END
    
    -- Atualizar o saldo_real da conta descontando o valor investido
    UPDATE c
    SET c.saldo_real = c.saldo_real - i.vlr_investido
    FROM [Conta] c
    INNER JOIN [Investimento] i ON c.id_conta = i.id_conta
    INNER JOIN [inserted] ins ON i.id_invest = ins.id_invest
    WHERE ins.ativo = 1
    
    -- Declaracao de variaveis
    DECLARE @dt_aplicacao DATETIME
    DECLARE @jurosmenor NUMERIC(14, 2)
    DECLARE @jurosmaior NUMERIC(14, 2)

    SELECT TOP 1 @dt_aplicacao = i.dt_aplicacao
    FROM inserted i

    SET @jurosmenor = 2.5
    SET @jurosmaior = 5

    -- Atualizar o valor_rendimento com base no tipo de investimento e diferença de datas
    UPDATE i
    SET i.vlr_rendimento = 
        CASE
            WHEN i.tp_investimento IN ('LCI', 'LCA', 'Renda fixa') THEN i.vlr_investido + i.vlr_investido * POWER((1 + @jurosmenor / 100), DATEDIFF(MINUTE, @dt_aplicacao, GETDATE()))
            WHEN i.tp_investimento = 'Tesouro direto' THEN i.vlr_investido + i.vlr_investido * POWER((1 + @jurosmaior / 100), DATEDIFF(MINUTE, @dt_aplicacao, GETDATE()))
            ELSE i.vlr_rendimento
        END
    FROM [Investimento] i
    INNER JOIN [inserted] ins ON i.id_invest = ins.id_invest
    WHERE ins.ativo = 1  
END;