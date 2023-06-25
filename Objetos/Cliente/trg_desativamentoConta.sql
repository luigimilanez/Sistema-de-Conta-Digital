-- Trigger da tabela Cliente
CREATE OR ALTER TRIGGER trg_ExclusaoConta ON [Cliente] FOR UPDATE, DELETE AS
BEGIN
    -- Verificar se houve alteração no status
    IF UPDATE(ativo)
    BEGIN
        -- Verificar se existem faturas em aberto
        IF EXISTS (SELECT 1 FROM [Fatura] WHERE id_conta IN (SELECT id_conta FROM inserted) AND ativo = 1)
        BEGIN
            -- Lançar erro e abortar a atualização
            RAISERROR('Não é possível desativar o cliente devido a faturas em aberto.', 16, 1)
            ROLLBACK TRANSACTION
            RETURN
        END
        
        -- Verificar se existem investimentos ativos
        IF EXISTS (SELECT 1 FROM [Investimento] WHERE id_conta IN (SELECT id_conta FROM inserted) AND ativo = 1)
        BEGIN
            -- Lançar erro e abortar a atualização
            RAISERROR('Não é possível desativar o cliente devido a investimentos ativos.', 16, 1)
            ROLLBACK TRANSACTION
            RETURN
        END
        
        -- Verificar se existem empréstimos ativos
        IF EXISTS (SELECT 1 FROM [Emprestimo] WHERE id_conta IN (SELECT id_conta FROM inserted) AND ativo = 1)
        BEGIN
            -- Lançar erro e abortar a atualização
            RAISERROR('Não é possível desativar o cliente devido a empréstimos ativos.', 16, 1)
            ROLLBACK TRANSACTION
            RETURN
        END
        
        -- Verificar se existem cartões de crédito ativos
        IF EXISTS (SELECT 1 FROM [Cartao] WHERE id_conta IN (SELECT id_conta FROM inserted) AND ativo = 1)
        BEGIN
            -- Lançar erro e abortar a atualização
            RAISERROR('Não é possível desativar o cliente devido a cartões de crédito ativos.', 16, 1)
            ROLLBACK TRANSACTION
            RETURN
        END
    END
END;