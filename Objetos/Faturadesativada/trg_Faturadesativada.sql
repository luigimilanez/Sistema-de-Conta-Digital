-- Trigger da tabela Faturadesativada
CREATE OR ALTER TRIGGER trg_Faturadesativada ON [Faturadesativada] AFTER INSERT AS
BEGIN
    -- Atualizar o saldo_real da conta, ignorando saldo negativo
    UPDATE C
    SET C.saldo_real = C.saldo_real - (F.valor + F.valor_emprest)
    FROM [Conta] C
    INNER JOIN [Fatura] F ON C.id_conta = F.id_conta
    INNER JOIN inserted I ON F.id_fatura = I.id_fatura
END;
GO