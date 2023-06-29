-- ************************************** [TRIGGER INVESTIMENTOS]

CREATE TRIGGER trg_carteira_investimento ON [dbo].[Investimento]
AFTER UPDATE 
AS
BEGIN
-- Declarando as variaveis
DECLARE @saldo_atual AS NUMERIC(12,2) 
DECLARE @vlr_investido AS NUMERIC(12,2) 
DECLARE @novo_saldo AS NUMERIC(12,2) 
DECLARE @dt_aplicacao AS DATETIME 
DECLARE @jurosFixo AS NUMERIC(12,2)
DECLARE @jurosmaior AS NUMERIC(12,2)
DECLARE @jurosmenor AS NUMERIC(12,2)
DECLARE @vlr_rendimento AS NUMERIC(12,2) 

-- Realizando calculo do valor saldo com a porecntagem de juros
SELECT (c.saldo_atual * 1.08) AS saldo_atual FROM [dbo].[Investimento] WHERE id_conta = id_conta
SELECT @saldo_atual (SELECT @vlr_investido FROM [dbo].[Investimento] GROUP BY dt_aplicacao)

IF EXISTS (SELECT 1 FROM [inserted] WHERE ativo = 0)
    BEGIN

-- Atualizar o saldo da conta com o valor rendido
        UPDATE [dbo].[Investimento] SET saldo_atual=c
        SET c.saldo_atual = c.saldo_atual + i.vlr_rendimento
        FROM [Conta] c
        INNER JOIN [Investimento] i ON c.id_conta = i.id_conta
        INNER JOIN [deleted] d ON i.id_invest = d.id_invest
        WHERE d.ativo = 1 AND i.ativo = 0
        
        RETURN
    END
-- Buscando novo valor apos o calculo
SELECT @vlr_investido = novo_saldo
FROM inserted
END