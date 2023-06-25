-- Trigger da tabela Emprestimodesativado
CREATE OR ALTER TRIGGER trg_Emprestimodesativado ON Emprestimodesativado AFTER INSERT AS
BEGIN
    SET NOCOUNT ON;

    -- Variáveis
    DECLARE @id_emprest INT;
    DECLARE @id_conta INT;
    DECLARE @saldo_devedor NUMERIC(14, 2);

    -- Obter os valores relevantes do empréstimo desativado inserido
    SELECT @id_emprest = id_emprest, @id_conta = id_conta, @saldo_devedor = saldo_devedor
    FROM Emprestimo
    WHERE id_emprest = (SELECT id_emprest FROM inserted);

    -- Verificar se há uma fatura em aberto para a conta associada ao empréstimo desativado
    IF EXISTS (SELECT 1 FROM Fatura WHERE id_conta = @id_conta AND ativo = 1)
    BEGIN
        -- Atualizar o saldo da fatura com base no valor do saldo_devedor do empréstimo
        UPDATE Fatura
        SET valor_emprest = valor_emprest + @saldo_devedor
        WHERE id_conta = @id_conta AND ativo = 1;
    END
    ELSE
    BEGIN
        -- Criar uma nova fatura com o valor_emprest igual ao saldo_devedor do empréstimo
        INSERT INTO Fatura (ativo, id_conta, valor, valor_emprest, dt_venc)
        VALUES (1, @id_conta, 0, @saldo_devedor, DATEADD(MINUTE, 6, GETDATE())); -- Coloque a data desejada para o vencimento da fatura
    END
END;