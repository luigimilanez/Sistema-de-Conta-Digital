-- Trigger para cria��o de contas via tabela Cliente
CREATE OR ALTER TRIGGER trg_InsertCliente
ON [Cliente]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;  -- � usada em uma instru��o SQL no SQL Server para controlar se o contador de linhas (row count) �
					 -- retornado como parte do resultado da consulta. 

    DECLARE @IdCliente INT, 
		@DataNascimento DATE, 
		@LimiteCredito DECIMAL(14, 2), 
		@LimiteEmprestimo DECIMAL(14, 2), 
		@TipoConta VARCHAR(64);

    SELECT @IdCliente = inserted.id_cliente,
           @DataNascimento = inserted.data_nasc
    FROM inserted;

    -- Calcula a idade do cliente
    DECLARE @Idade INT;
    SET @Idade = DATEDIFF(YEAR, @DataNascimento, GETDATE());

    -- Define o limite de cr�dito e limite de empr�stimo com base na idade
    IF @Idade < 25
    BEGIN
        SET @LimiteCredito = 2500.00;
        SET @LimiteEmprestimo = 4000.00;
		set @TipoConta = 'Corrente'
    END
    ELSE IF @Idade <= 35
    BEGIN
        SET @LimiteCredito = 5000.00;
        SET @LimiteEmprestimo = 12000.00;
		set @TipoConta = 'Corrente'
    END
	ELSE
	BEGIN
		SET @LimiteCredito = 15000.00;
        SET @LimiteEmprestimo = 35000.00;
		set @TipoConta = 'Poupanca'
	END

    -- Insere um novo registro na tabela Conta
    INSERT INTO [Conta] (id_cliente, tp_conta, saldo_real, lim_credito, lim_emprest)
    VALUES (@IdCliente, @TipoConta, 0.00, @LimiteCredito, @LimiteEmprestimo);
END;
GO