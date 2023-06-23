-- Trigger tabela Cambio
CREATE OR ALTER TRIGGER trg_CambioConversao ON [Cambio] AFTER INSERT AS
BEGIN
    -- Definir os valores das moedas em relação ao BRL
    DECLARE @valor_dolar numeric(14,2) = 4.77
    DECLARE @valor_euro numeric(14,2) = 5.22

    -- Variáveis para armazenar os valores da inserção
	DECLARE @id_cambio int
    DECLARE @id_conta int
    DECLARE @moeda_origem varchar(10)
    DECLARE @moeda_dest varchar(10)
    DECLARE @valor_origem numeric(14,2)
    DECLARE @valor_dest numeric(14,2)
    DECLARE @id_cliente int
    DECLARE @ativo bit

    -- Obter os valores da inserção
    SELECT
	    @id_cambio = inserted.id_cambio,
        @id_conta = inserted.id_conta,
        @moeda_origem = inserted.moeda_origem,
        @moeda_dest = inserted.moeda_dest,
        @valor_origem = inserted.valor_origem
    FROM
        inserted

    -- Obter o id_cliente associado à conta e verificar se a conta está ativa
    SELECT @id_cliente = C.id_cliente, @ativo = C.ativo
    FROM [Conta] AS CO
    INNER JOIN [Cliente] AS C ON CO.id_cliente = C.id_cliente
    WHERE CO.id_conta = @id_conta

    -- Verificar se a conta está desativada
    IF @ativo = 0
    BEGIN
        RAISERROR('A conta está desativada. Não é possível realizar o câmbio.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END

    -- Verificar se a conta possui saldo suficiente para a conversão
    IF (@moeda_origem = 'BRL' AND @valor_origem > (SELECT saldo_real FROM [Conta] WHERE id_conta = @id_conta)) OR
       (@moeda_origem = 'USD' AND @valor_origem > (SELECT saldo_dolar FROM [Conta] WHERE id_conta = @id_conta)) OR
       (@moeda_origem = 'EUR' AND @valor_origem > (SELECT saldo_euro FROM [Conta] WHERE id_conta = @id_conta))
    BEGIN
        RAISERROR('A conta não possui saldo suficiente para realizar o câmbio.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END

    -- BRLizar a conversão de moeda
    IF @moeda_origem = 'BRL' AND @moeda_dest = 'USD'
	BEGIN
        SET @valor_dest = @valor_origem / @valor_dolar
		UPDATE [Conta] SET saldo_real = saldo_real - @valor_origem WHERE id_conta = @id_conta
		UPDATE [Conta] SET saldo_dolar = saldo_dolar + @valor_dest WHERE id_conta = @id_conta
		UPDATE [Cambio] SET valor_dest = @valor_dest WHERE id_cambio = @id_cambio
	END
    ELSE IF @moeda_origem = 'BRL' AND @moeda_dest = 'EUR'
	BEGIN
        SET @valor_dest = @valor_origem / @valor_euro
		UPDATE [Conta] SET saldo_real = saldo_real - @valor_origem WHERE id_conta = @id_conta
		UPDATE [Conta] SET saldo_euro = saldo_euro + @valor_dest WHERE id_conta = @id_conta
		UPDATE [Cambio] SET valor_dest = @valor_dest WHERE id_cambio = @id_cambio
	END
    ELSE IF @moeda_origem = 'USD' AND @moeda_dest = 'BRL'
	BEGIN
        SET @valor_dest = @valor_origem * @valor_dolar
		UPDATE [Conta] SET saldo_dolar = saldo_dolar - @valor_origem WHERE id_conta = @id_conta
		UPDATE [Conta] SET saldo_real = saldo_real + @valor_dest WHERE id_conta = @id_conta
		UPDATE [Cambio] SET valor_dest = @valor_dest WHERE id_cambio = @id_cambio
	END
    ELSE IF @moeda_origem = 'USD' AND @moeda_dest = 'EUR'
	BEGIN
        SET @valor_dest = (@valor_origem * @valor_dolar) / @valor_euro
		UPDATE [Conta] SET saldo_dolar = saldo_dolar - @valor_origem WHERE id_conta = @id_conta
		UPDATE [Conta] SET saldo_euro = saldo_euro + @valor_dest WHERE id_conta = @id_conta
		UPDATE [Cambio] SET valor_dest = @valor_dest WHERE id_cambio = @id_cambio
	END
    ELSE IF @moeda_origem = 'EUR' AND @moeda_dest = 'BRL'
	BEGIN
        SET @valor_dest = @valor_origem * @valor_euro
		UPDATE [Conta] SET saldo_euro = saldo_euro - @valor_origem WHERE id_conta = @id_conta
		UPDATE [Conta] SET saldo_real = saldo_real + @valor_dest WHERE id_conta = @id_conta
		UPDATE [Cambio] SET valor_dest = @valor_dest WHERE id_cambio = @id_cambio
	END
	ELSE IF @moeda_origem = 'EUR' AND @moeda_dest = 'USD'
	BEGIN
		SET @valor_dest = @valor_origem * (@valor_euro / @valor_dolar)
		UPDATE [Conta] SET saldo_euro = saldo_euro - @valor_origem WHERE id_conta = @id_conta
		UPDATE [Conta] SET saldo_dolar = saldo_dolar + @valor_dest WHERE id_conta = @id_conta
		UPDATE [Cambio] SET valor_dest = @valor_dest WHERE id_cambio = @id_cambio
	END
	ELSE
	BEGIN
		RAISERROR('Moeda não reconhecida', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
	END
END