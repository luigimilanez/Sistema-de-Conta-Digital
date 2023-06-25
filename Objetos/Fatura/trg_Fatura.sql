-- Trigger da tabela Fatura
CREATE OR ALTER TRIGGER trg_Fatura ON [Fatura] AFTER INSERT, UPDATE AS
BEGIN
    DECLARE @counter INT
    DECLARE @rowCount INT
    DECLARE @id_fatura INT

    SELECT @rowCount = COUNT(id_fatura) FROM Fatura WHERE dt_venc < GETDATE()
    SET @counter = 1

    WHILE @counter <= @rowCount
    BEGIN
        SELECT @id_fatura = id_fatura
        FROM (
            SELECT id_fatura, ROW_NUMBER() OVER (ORDER BY id_fatura) AS RowNum
            FROM Fatura
            WHERE dt_venc < GETDATE()
        ) AS F
        WHERE F.RowNum = @counter

        -- Verificar se o ID da fatura já existe na tabela Faturadesativada
        IF NOT EXISTS (SELECT 1 FROM Faturadesativada WHERE id_fatura = @id_fatura)
        BEGIN
            -- Inserir a linha na tabela Faturadesativada
            INSERT INTO [Faturadesativada] ([id_fatura])
            VALUES (@id_fatura)

            -- Alterar o status da fatura para desativado
            UPDATE [Fatura]
            SET [ativo] = 0
            WHERE [id_fatura] = @id_fatura
        END

        SET @counter += 1
    END
END;
GO