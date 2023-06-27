CREATE OR ALTER TRIGGER trg_DeleteCliente ON [Cliente] INSTEAD OF DELETE AS
BEGIN
    SET NOCOUNT ON;

    -- Armazena os IDs dos clientes a serem excluídos
    DECLARE @DeletedClientes TABLE (id_cliente int);

    -- Insere os IDs dos clientes a serem excluídos na tabela temporária
    INSERT INTO @DeletedClientes (id_cliente)
    SELECT id_cliente
    FROM deleted;

	-- Inserir os dados dos clientes excluídos na tabela de log
    INSERT INTO log_cliente_deletado (
        id_cliente, ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao,
        id_conta, tp_conta, saldo_real, saldo_dolar, saldo_euro, lim_credito, lim_emprest,
        id_cambio, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio,
        dt_aplicacao, id_emprest, valor_emprest, taxa_juros, data_contratacao, data_venc,
        saldo_devedor, id_fatura, numero, titular, dt_validade, code_sec, id_trans, tp_trans, status
    )
    SELECT DISTINCT
        c.id_cliente, c.ativo, c.nome, c.cpf, c.data_nasc, c.phone, c.endereco, c.email, c.senha, c.dt_criacao,
        co.id_conta, co.tp_conta, co.saldo_real, co.saldo_dolar, co.saldo_euro, co.lim_credito, co.lim_emprest,
        ca.id_cambio, ca.moeda_origem, ca.moeda_dest, ca.valor_origem, ca.valor_dest, ca.dt_cambio,
        i.dt_aplicacao, e.id_emprest, e.valor_emprest, e.taxa_juros, e.data_contratacao, e.data_venc,
        e.saldo_devedor, f.id_fatura, car.numero, car.titular, car.dt_validade, car.code_sec, t.id_trans, t.tp_trans, t.status
    FROM deleted d
    LEFT JOIN [Cliente] c ON c.id_cliente = d.id_cliente
    LEFT JOIN [Conta] co ON co.id_cliente = c.id_cliente
    LEFT JOIN [Cambio] ca ON ca.id_conta = co.id_conta
    LEFT JOIN [Investimento] i ON i.id_conta = co.id_conta
    LEFT JOIN [Emprestimo] e ON e.id_conta = co.id_conta
    LEFT JOIN [Fatura] f ON f.id_conta = co.id_conta
    LEFT JOIN [Cartao] car ON car.id_conta = co.id_conta
    LEFT JOIN [Transacao] t ON (t.id_cliente = c.id_cliente OR t.id_conta = co.id_conta)
    WHERE c.id_cliente IN (SELECT id_cliente FROM @DeletedClientes);

    -- Exclui as transações associadas às contas dos clientes
    DELETE FROM [Transacao]
    WHERE id_conta IN (SELECT id_conta FROM [Conta] WHERE id_cliente IN (SELECT id_cliente FROM @DeletedClientes));

    -- Exclui as transações associadas diretamente aos clientes
    DELETE FROM [Transacao]
    WHERE id_cliente IN (SELECT id_cliente FROM @DeletedClientes);

    -- Exclui os registros vinculados à tabela Faturadesativada
    DELETE FROM [Faturadesativada]
    WHERE id_fatura IN (SELECT id_fatura FROM [Fatura] WHERE id_conta IN (SELECT id_conta FROM [Conta] WHERE id_cliente IN (SELECT id_cliente FROM @DeletedClientes)));

    -- Exclui os registros vinculados à tabela Fatura
    DELETE FROM [Fatura]
    WHERE id_conta IN (SELECT id_conta FROM [Conta] WHERE id_cliente IN (SELECT id_cliente FROM @DeletedClientes));

    -- Exclui os registros vinculados à tabela Investimento
    DELETE FROM [Investimento]
    WHERE id_conta IN (SELECT id_conta FROM [Conta] WHERE id_cliente IN (SELECT id_cliente FROM @DeletedClientes));

    -- Exclui os registros vinculados à tabela Emprestimodesativado
    DELETE FROM [Emprestimodesativado]
    WHERE id_emprest IN (SELECT id_emprest FROM [Emprestimo] WHERE id_conta IN (SELECT id_conta FROM [Conta] WHERE id_cliente IN (SELECT id_cliente FROM @DeletedClientes)));

    -- Exclui os registros vinculados à tabela Emprestimo
    DELETE FROM [Emprestimo]
    WHERE id_conta IN (SELECT id_conta FROM [Conta] WHERE id_cliente IN (SELECT id_cliente FROM @DeletedClientes));

    -- Exclui os registros vinculados à tabela Cambio
    DELETE FROM [Cambio]
    WHERE id_conta IN (SELECT id_conta FROM [Conta] WHERE id_cliente IN (SELECT id_cliente FROM @DeletedClientes));

    -- Exclui os registros vinculados à tabela Cartao
    DELETE FROM [Cartao]
    WHERE id_conta IN (SELECT id_conta FROM [Conta] WHERE id_cliente IN (SELECT id_cliente FROM @DeletedClientes));

    -- Exclui os registros da tabela Conta
    DELETE FROM [Conta]
    WHERE id_cliente IN (SELECT id_cliente FROM @DeletedClientes);

    -- Exclui os clientes
    DELETE FROM [Cliente]
    WHERE id_cliente IN (SELECT id_cliente FROM @DeletedClientes);

END;