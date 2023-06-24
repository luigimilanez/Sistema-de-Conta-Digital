-- Trigger para verificação de limite de empréstimo na conta utilizada
CREATE TRIGGER trg_InsertEmprestimo ON Emprestimo FOR INSERT AS
BEGIN
	DECLARE @id_conta INT,
			@lim_emprest NUMERIC(14,2),
			@valor_emprest NUMERIC(14,2);

	SELECT @id_conta = id_conta, @valor_emprest = valor_emprest FROM inserted;
	SELECT @lim_emprest = lim_emprest FROM Conta WHERE id_conta = @id_conta;

  -- Faz a verificação do limite de empréstimo. Caso o valor desejado seja maior que o limite, impede o empréstimo
	IF(@valor_emprest > @lim_emprest)
	BEGIN
		RAISERROR('O valor do empréstimo é superior ao limite de empréstimo.', 16, 1)
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
    -- Atualiza o limite de empréstimo e o saldo na conta
		UPDATE Conta SET lim_emprest -= @valor_emprest, saldo_real += @valor_emprest WHERE id_conta = @id_conta
	END
END;
GO
