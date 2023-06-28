-- Arquivo de geracao global

-- ************************************** [Cliente]
CREATE TABLE [Cliente]
(
 [id_cliente] int identity ,
 [ativo]      bit NOT NULL ,
 [nome]       varchar(100) NOT NULL ,
 [cpf]        varchar(18) NOT NULL ,
 [data_nasc]  date NOT NULL ,
 [phone]      varchar(20) NOT NULL ,
 [endereco]   varchar(max) NOT NULL ,
 [email]      varchar(100) NOT NULL ,
 [senha]      varchar(64) NOT NULL ,
 [dt_criacao] datetime NOT NULL ,


 CONSTRAINT [pk_Cliente] PRIMARY KEY CLUSTERED ([id_cliente] ASC),
 CONSTRAINT [idx_cpf] UNIQUE NONCLUSTERED ([cpf] ASC),
 CONSTRAINT [idx_email] UNIQUE NONCLUSTERED ([email] ASC),
 CONSTRAINT [idx_phone] UNIQUE NONCLUSTERED ([phone] ASC)
);
GO


-- ************************************** [Conta]
CREATE TABLE [Conta]
(
 [id_conta]    int identity ,
 [id_cliente]  int NOT NULL ,
 [tp_conta]    varchar(64) NOT NULL ,
 [saldo_real]  numeric(14,2) NOT NULL ,
 [saldo_dolar] numeric(14,2) NOT NULL ,
 [saldo_euro]  numeric(14,2) NOT NULL ,
 [lim_credito] numeric(14,2) NOT NULL ,
 [lim_emprest] numeric(14,2) NOT NULL ,


 CONSTRAINT [pk_Conta] PRIMARY KEY CLUSTERED ([id_conta] ASC),
 CONSTRAINT [fk_Cliente__Conta] FOREIGN KEY ([id_cliente])  REFERENCES [Cliente]([id_cliente])
);
GO


-- ************************************** [Cambio]
CREATE TABLE [Cambio]
(
 [id_cambio]    int identity ,
 [id_conta]     int NOT NULL ,
 [moeda_origem] varchar(10) NOT NULL ,
 [moeda_dest]   varchar(10) NOT NULL ,
 [valor_origem] numeric(14,2) NOT NULL ,
 [valor_dest]   numeric(14,2) NOT NULL ,
 [dt_cambio]    datetime NOT NULL ,


 CONSTRAINT [pk_Cambio] PRIMARY KEY CLUSTERED ([id_cambio] ASC),
 CONSTRAINT [fk_Conta__Cambio] FOREIGN KEY ([id_conta])  REFERENCES [Conta]([id_conta])
);
GO


-- ************************************** [Investimento]
CREATE TABLE [Investimento]
(
 [id_invest]       int identity ,
 [ativo]           bit NOT NULL ,
 [id_conta]        int NOT NULL ,
 [tp_investimento] varchar(64) NOT NULL ,
 [vlr_investido]   numeric(14,2) NOT NULL ,
 [vlr_rendimento]  numeric(14,2) NULL ,
 [dt_aplicacao]    datetime NOT NULL ,


 CONSTRAINT [pk_Investimento] PRIMARY KEY CLUSTERED ([id_invest] ASC),
 CONSTRAINT [fk_Conta__Investimento] FOREIGN KEY ([id_conta])  REFERENCES [Conta]([id_conta])
);
GO


-- ************************************** [Emprestimo]
CREATE TABLE [Emprestimo]
(
 [id_emprest]       int identity ,
 [ativo]            bit NOT NULL ,
 [id_conta]         int NOT NULL ,
 [valor_emprest]    numeric(14,2) NOT NULL ,
 [taxa_juros]       numeric(14,2) NOT NULL ,
 [data_contratacao] datetime NOT NULL ,
 [data_venc]        datetime NOT NULL ,
 [saldo_devedor]    numeric(14,2) NOT NULL ,


 CONSTRAINT [pk_Emprestimo] PRIMARY KEY CLUSTERED ([id_emprest] ASC),
 CONSTRAINT [fk_Conta__Emprestimo] FOREIGN KEY ([id_conta])  REFERENCES [Conta]([id_conta])
);
GO


-- ************************************** [Emprestimodesativado]
CREATE TABLE [Emprestimodesativado]
(
 [id_empdesat] int IDENTITY ,
 [id_emprest]  int NOT NULL ,


 CONSTRAINT [pk_Emprestimodesativado] PRIMARY KEY CLUSTERED ([id_empdesat] ASC),
 CONSTRAINT [idx_id_emprest] UNIQUE NONCLUSTERED ([id_emprest] ASC),
 CONSTRAINT [fk_Emprestimo__Emprestimodesativado] FOREIGN KEY ([id_emprest])  REFERENCES [Emprestimo]([id_emprest])
);
GO


-- ************************************** [Cartao]
CREATE TABLE [Cartao]
(
 [id_cartao]   int identity ,
 [ativo]       bit NOT NULL ,
 [id_conta]    int NOT NULL ,
 [numero]      varchar(16) NOT NULL ,
 [titular]     varchar(100) NOT NULL ,
 [dt_validade] date NOT NULL ,
 [code_sec]    varchar(4) NOT NULL ,


 CONSTRAINT [pk_Cartao] PRIMARY KEY CLUSTERED ([id_cartao] ASC),
 CONSTRAINT [idx_numero] UNIQUE NONCLUSTERED ([numero] ASC),
 CONSTRAINT [fk_Conta__Cartao] FOREIGN KEY ([id_conta])  REFERENCES [Conta]([id_conta])
);
GO


-- ************************************** [Transacao]
CREATE TABLE [Transacao]
(
 [id_trans]   int identity ,
 [id_conta]   int NOT NULL ,
 [id_cliente] int NOT NULL ,
 [data]       datetime NOT NULL ,
 [tp_trans]   varchar(64) NOT NULL ,
 [status]     varchar(40) NULL ,
 [valor]      numeric(14,2) NOT NULL ,


 CONSTRAINT [pk_Transacao] PRIMARY KEY CLUSTERED ([id_trans] ASC),
 CONSTRAINT [fk_Cliente__Transacao] FOREIGN KEY ([id_cliente])  REFERENCES [Cliente]([id_cliente]),
 CONSTRAINT [fk_Conta__Transacao] FOREIGN KEY ([id_conta])  REFERENCES [Conta]([id_conta])
);
GO


-- ************************************** [Fatura]
CREATE TABLE [Fatura]
(
 [id_fatura]     int identity ,
 [ativo]         bit NOT NULL ,
 [id_conta]      int NOT NULL ,
 [valor]         numeric(14,2) NOT NULL ,
 [valor_emprest] numeric(14,2) NOT NULL ,
 [dt_venc]       datetime NOT NULL ,


 CONSTRAINT [pk_Fatura] PRIMARY KEY CLUSTERED ([id_fatura] ASC),
 CONSTRAINT [fk_Conta__Fatura] FOREIGN KEY ([id_conta])  REFERENCES [Conta]([id_conta]),
);
GO


-- ************************************** [Faturadesativada]
CREATE TABLE [Faturadesativada]
(
 [id_fatdesat] int IDENTITY ,
 [id_fatura]   int NOT NULL ,


 CONSTRAINT [pk_Faturadesativada] PRIMARY KEY CLUSTERED ([id_fatdesat] ASC),
 CONSTRAINT [idx_fatura] UNIQUE NONCLUSTERED ([id_fatura] ASC),
 CONSTRAINT [fk_Fatura__Faturadesativada] FOREIGN KEY ([id_fatura])  REFERENCES [Fatura]([id_fatura])
);
GO


-- ************************************** [log_cliente_deletado]
CREATE TABLE [log_cliente_deletado]
(
 [id_log]               int identity ,
 [id_cliente]           int NOT NULL ,
 [ativo]                bit NOT NULL ,
 [nome]                 varchar(100) NOT NULL ,
 [cpf]                  varchar(18) NOT NULL ,
 [data_nasc]            date NOT NULL ,
 [phone]                varchar(20) NOT NULL ,
 [endereco]             varchar(max) NOT NULL ,
 [email]                varchar(100) NOT NULL ,
 [senha]                varchar(64) NOT NULL ,
 [dt_criacao]           datetime NOT NULL ,
 [id_conta]             int NOT NULL ,
 [tp_conta]             varchar(64) NOT NULL ,
 [saldo_real]           numeric(14,2) NOT NULL ,
 [saldo_dolar]          numeric(14,2) NOT NULL ,
 [saldo_euro]           numeric(14,2) NOT NULL ,
 [lim_credito]          numeric(14,2) NOT NULL ,
 [lim_emprest]          numeric(14,2) NOT NULL ,
 [id_cambio]            int NULL ,
 [moeda_origem]         varchar(10) NULL ,
 [moeda_dest]           varchar(10) NULL ,
 [valor_origem]         numeric(14,2) NULL ,
 [valor_dest]           numeric(14,2) NULL ,
 [dt_cambio]            datetime NULL ,
 [id_invest]            int NULL ,
 [ativo_invest]         bit NULL ,
 [tp_investimento]      varchar(64) NULL ,
 [vlr_investido]        numeric(14,2) NULL ,
 [vlr_rendimento]       numeric(14,2) NULL ,
 [dt_aplicacao]         datetime NULL ,
 [id_emprest]           int NULL ,
 [ativo_emprest]        bit NULL ,
 [valor_emprest]        numeric(14,2) NULL ,
 [taxa_juros]           numeric(14,2) NULL ,
 [data_contratacao]     datetime NULL ,
 [data_venc]            datetime NULL ,
 [saldo_devedor]        numeric(14,2) NULL ,
 [id_empdesat]          int NULL ,
 [id_fatura]            int NULL ,
 [ativo_fatura]         bit NULL ,
 [valor_fatura]         numeric(14,2) NULL ,
 [valor_emprest_fatura] numeric(14,2) NULL ,
 [dt_venc]              datetime NULL ,
 [id_fatdesat]          int NULL ,
 [id_cartao]            int NULL ,
 [ativo_cartao]         bit NULL ,
 [numero]               varchar(100) NULL ,
 [titular]              varchar(100) NULL ,
 [dt_validade]          date NULL ,
 [code_sec]             varchar(4) NULL ,
 [id_trans]             int NULL ,
 [id_cliente_trans]     int NULL ,
 [id_conta_trans]       int NULL ,
 [data_trans]           datetime NULL ,
 [tp_trans]             varchar(64) NULL ,
 [status]               varchar(40) NULL ,
 [data_log_delete]      datetime NOT NULL ,


 CONSTRAINT [pk_log_cliente_deletado] PRIMARY KEY CLUSTERED ([id_log] ASC)
);
GO


-- Trigger para criação de contas via tabela Cliente
CREATE OR ALTER TRIGGER trg_InsertCliente ON [Cliente] AFTER INSERT AS
BEGIN
    SET NOCOUNT ON;  -- é usada em uma instrução SQL no SQL Server para controlar se o contador de linhas (row count) é
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

    -- Define o limite de crédito e limite de empréstimo com base na idade
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
    INSERT INTO [Conta] (id_cliente, tp_conta, saldo_real, saldo_dolar, saldo_euro, lim_credito, lim_emprest)
    VALUES (@IdCliente, @TipoConta, 0.00, 0.00, 0.00, @LimiteCredito, @LimiteEmprestimo);
END;
GO


-- Trigger da tabela Cliente
CREATE OR ALTER TRIGGER trg_DesativamentoConta ON [Cliente] FOR UPDATE, DELETE AS
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


-- Trigger da tabela Emprestimo
CREATE OR ALTER TRIGGER trg_Emprestimo ON Emprestimo AFTER INSERT, UPDATE AS
BEGIN
    -- Verificar se a conta está ativa
    IF EXISTS (
        SELECT 1 FROM inserted i
        INNER JOIN Conta c ON i.id_conta = c.id_conta
        INNER JOIN Cliente cl ON c.id_cliente = cl.id_cliente
        WHERE cl.ativo = 0
    )
    BEGIN
        RAISERROR('A conta está inativa. Operação de empréstimo não permitida.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END

    -- Verificar se há saldo no limite de empréstimo na conta do usuário
    IF EXISTS (
        SELECT 1 FROM inserted i
        INNER JOIN Conta c ON i.id_conta = c.id_conta
        WHERE c.lim_emprest < i.valor_emprest
    )
    BEGIN
        RAISERROR('A conta não possui saldo suficiente no limite de empréstimo.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END

    -- Verificar se o saldo_real da conta é maior ou igual a 0
    IF EXISTS (
        SELECT 1 FROM inserted i
        INNER JOIN Conta c ON i.id_conta = c.id_conta
        WHERE c.saldo_real < 0
    )
    BEGIN
        RAISERROR('A conta possui saldo negativo. Operação de empréstimo não permitida.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END

    -- Armazenar valores necessários em variáveis
    DECLARE @id_emprest int
    DECLARE @id_conta int
    DECLARE @valor_emprest numeric(14, 2)
    DECLARE @taxa_juros numeric(14, 2)
    DECLARE @data_venc datetime
    SELECT @id_emprest = i.id_emprest,
           @id_conta = i.id_conta,
           @valor_emprest = i.valor_emprest,
           @taxa_juros = i.taxa_juros,
           @data_venc = i.data_venc
    FROM inserted i

    -- Calcular o saldo devedor considerando a taxa de juros e a diferença de minutos
    DECLARE @saldo_devedor numeric(14, 2)
    SET @saldo_devedor = @valor_emprest * POWER((1 + @taxa_juros / 100), DATEDIFF(MINUTE, GETDATE(), @data_venc))

    -- Atualizar o saldo_devedor na tabela Emprestimo
    UPDATE e
    SET e.saldo_devedor = @saldo_devedor
    FROM Emprestimo e
    INNER JOIN inserted i ON e.id_emprest = i.id_emprest

    -- Atualizar o limite de empréstimo na conta do usuário
    UPDATE c
    SET c.lim_emprest = c.lim_emprest - @valor_emprest
    FROM Conta c
    INNER JOIN inserted i ON c.id_conta = i.id_conta

    -- Desativar empréstimos vencidos
    UPDATE e
    SET e.ativo = 0
    FROM Emprestimo e
    WHERE e.data_venc < GETDATE()

    -- Verificar se há empréstimos vencidos
    IF EXISTS (
        SELECT 1 FROM Emprestimo
        WHERE data_venc < GETDATE()
    )
    BEGIN
        -- Mover empréstimos vencidos para a tabela Emprestimodesativado (apenas se ainda não estiverem na tabela)
        INSERT INTO Emprestimodesativado (id_emprest)
        SELECT e.id_emprest
        FROM Emprestimo e
        LEFT JOIN Emprestimodesativado ed ON e.id_emprest = ed.id_emprest
        WHERE e.data_venc < GETDATE()
            AND ed.id_emprest IS NULL
    END
END;


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


-- Trigger da tabela Transacao
CREATE OR ALTER TRIGGER trg_TransacaoCondicoes ON [Transacao] AFTER INSERT AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @IdContaPagador INT;
    DECLARE @IdClienteBeneficiario INT;
    DECLARE @TipoTransacao VARCHAR(64);
    DECLARE @ValorTransacao NUMERIC(14,2);
    DECLARE @SaldoPagador NUMERIC(14,2);
    
    SELECT @IdContaPagador = i.id_conta,
           @IdClienteBeneficiario = i.id_cliente,
           @TipoTransacao = i.tp_trans,
           @ValorTransacao = i.valor
    FROM inserted i;
    
    -- Verificar se a conta pagadora ou beneficiária está ativa
    IF (SELECT ativo FROM Cliente WHERE id_cliente = @IdContaPagador) = 0 OR (SELECT ativo FROM [Cliente] WHERE id_cliente = @IdClienteBeneficiario) = 0
    BEGIN
        UPDATE Transacao
        SET status = 'Reprovado'
        WHERE id_trans = (SELECT id_trans FROM inserted);
        
        RAISERROR('A conta pagadora ou beneficiária não está ativa. A transação foi reprovada.', 16, 1);
        --ROLLBACK;
        RETURN;
    END;
    
    -- Verificar saldo e efetuar transferência
    IF @TipoTransacao IN ('PIX', 'Transferencia', 'Debito')
    BEGIN
        -- Verificar saldo do pagador
        SELECT @SaldoPagador = saldo_real
        FROM Conta
        WHERE id_conta = @IdContaPagador;
        
        IF @ValorTransacao > @SaldoPagador
        BEGIN
            -- Valor da transação é maior do que o saldo do pagador, reprovar a transação
            UPDATE Transacao
            SET status = 'Reprovado'
            WHERE id_trans = (SELECT id_trans FROM inserted);
            
            RAISERROR('Saldo insuficiente na conta do pagador. A transação foi reprovada.', 16, 1);
            --ROLLBACK;
            RETURN;
        END;
        
        -- Descontar saldo do pagador
        UPDATE Conta
        SET saldo_real = saldo_real - @ValorTransacao
        WHERE id_conta = @IdContaPagador;
        
        -- Incrementar saldo do beneficiário
        UPDATE Conta
        SET saldo_real = saldo_real + @ValorTransacao
        WHERE id_conta = @IdClienteBeneficiario;
        
        -- Atualizar status da transação
        UPDATE Transacao
        SET status = 'Aprovado'
        WHERE id_trans = (SELECT id_trans FROM inserted);
    END;
    
    -- Realizar operação de Depósito
    IF @TipoTransacao = 'Deposito'
    BEGIN
        -- Incrementar saldo do beneficiário
        UPDATE Conta
        SET saldo_real = saldo_real + @ValorTransacao
        WHERE id_conta = @IdClienteBeneficiario;
        
        -- Atualizar status da transação
        UPDATE Transacao
        SET status = 'Aprovado'
        WHERE id_trans = (SELECT id_trans FROM inserted);
    END;

    -- Realizar operação de Crédito
    IF @TipoTransacao = 'Credito'
    BEGIN
        DECLARE @LimiteCredito NUMERIC(14,2);
        
        SELECT @LimiteCredito = lim_credito
        FROM Conta
        WHERE id_conta = @IdContaPagador;
        
        IF @LimiteCredito >= @ValorTransacao
        BEGIN
            -- Incrementar saldo do beneficiário
            UPDATE Conta
            SET saldo_real = saldo_real + @ValorTransacao
            WHERE id_conta = @IdClienteBeneficiario;
            
            -- Reduzir limite de crédito do pagador
            UPDATE Conta
            SET lim_credito = lim_credito - @ValorTransacao
            WHERE id_conta = @IdContaPagador;
            
            -- Atualizar status da transação
            UPDATE Transacao
            SET status = 'Aprovado'
            WHERE id_trans = (SELECT id_trans FROM inserted);
        END
        ELSE
        BEGIN
            -- Limite de crédito insuficiente, reprovar a transação
            UPDATE Transacao
            SET status = 'Reprovado'
            WHERE id_trans = (SELECT id_trans FROM inserted);
            
            RAISERROR('Limite de crédito insuficiente na conta do pagador. A transação foi reprovada.', 16, 1);
            --ROLLBACK;
            RETURN;
        END;
    END;

    -- Verificar se há uma fatura ativa
    IF @TipoTransacao NOT IN ('Debito', 'PIX', 'Deposito', 'Transferencia')
    BEGIN
        DECLARE @IdFatura INT;
        
        SELECT @IdFatura = id_fatura
        FROM Fatura
        WHERE id_conta = @IdContaPagador
        AND ativo = 1;
        
        IF @IdFatura IS NOT NULL
        BEGIN
            -- Adicionar valor da transação à fatura ativa
            UPDATE Fatura
            SET valor = valor + @ValorTransacao
            WHERE id_fatura = @IdFatura;
        END
        ELSE
        BEGIN
            -- Criar nova fatura com o valor da transação
            INSERT INTO Fatura (ativo, id_conta, valor, valor_emprest, dt_venc)
            VALUES (1, @IdContaPagador, @ValorTransacao, 0, DATEADD(minute, 3, GETDATE()));
        END;
    END;
END;


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


-- Trigger que insere os dados deletado na tabela LOG antes de deletar por si so os usuarios
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
        saldo_devedor, id_fatura, numero, titular, dt_validade, code_sec, id_trans, tp_trans, status,
		data_log_delete
    )
    SELECT DISTINCT
        c.id_cliente, c.ativo, c.nome, c.cpf, c.data_nasc, c.phone, c.endereco, c.email, c.senha, c.dt_criacao,
        co.id_conta, co.tp_conta, co.saldo_real, co.saldo_dolar, co.saldo_euro, co.lim_credito, co.lim_emprest,
        ca.id_cambio, ca.moeda_origem, ca.moeda_dest, ca.valor_origem, ca.valor_dest, ca.dt_cambio,
        i.dt_aplicacao, e.id_emprest, e.valor_emprest, e.taxa_juros, e.data_contratacao, e.data_venc,
        e.saldo_devedor, f.id_fatura, car.numero, car.titular, car.dt_validade, car.code_sec, t.id_trans, t.tp_trans, t.status,
		getdate()
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


set dateformat ymd  -- server para definir o formato do datetime em YY/MM/DD (english)

-- ************************************** [INSERTS Cliente]

INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Paulo Mendes', '11122233344', '1980-12-12', '912341234', 'Criciuma', 'paulomendes@gmail.com', '112233', '2022-04-22 11:30:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Paulo Gomes', '11111111122', '1990-01-15', '943214321', 'Criciuma', 'paulogomes@gmail.com', '123123', '2021-02-27 08:30:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Joao de Souza', '99999988877', '1980-05-18', '944445555', 'Florianopolis', 'joaodesouza33@gmail.com', '564732', '2020-09-23 12:40:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Kelvin Cleo', '66677755544', '1993-04-01', '991235432', 'Gaspar', 'kelvincleo21@gmail.com', '998871', '2019-03-29 16:30:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Julio Fiodor', '17177766688', '1977-08-01', '999998888', 'Florianopolis', 'juliofiodor2@gmail.com', '556644', '2017-02-01 13:30:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Gustavo Nava', '22211133344', '1981-11-26', '993218765', 'Florianopolis', 'gustavonava998@gmail.com', '876876', '2023-01-01 16:50:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Danilo Guindaste', '66655543422', '1999-12-17', '940028922', 'Criciuma', 'daniloguindastez@gmail.com', '554281', '2015-02-05 09:30:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Flavia Scussel', '88776655443', '1982-10-07', '911118888', 'Sideropolis', 'flaviascussel982@gmail.com', '123888', '2019-12-18 11:30:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Valeria Alavanca', '77711133344', '1989-08-21', '988877799', 'Sideropolis', 'valeriaalavanca@gmail.com', '332255', '2020-01-25 10:42:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Lucia Mattos', '77754522871', '1976-05-05', '917284928', 'Florianopolis', 'luciamattosxd@gmail.com', '102876', '2014-03-27 14:15:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Giovanna Lambreta', '33322288865', '2000-10-28', '999955555', 'Treviso', 'giovannalambreta322@gmail.com', '444555', '2014-06-18 10:55:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Ana Julia da Silva', '98172312344', '1995-06-16', '922448877', 'Criciuma', 'anajsilva1@gmail.com', '776612', '2015-01-01 17:00:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Eliana Demencio', '22211111144', '1980-01-25', '987658765', 'Laguna', 'elianademencio98@gmail.com', '325466', '2016-06-16 16:16:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Chloe Regard', '98798798711', '2001-12-25', '999886251', 'Laguna', 'chloeregard123@gmail.com', '887123', '2017-07-21 14:10:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Wellington Trevoso', '12333377712', '1996-07-07', '99940028911', 'Sideropolis', 'wellingtonmetaleiro@gmail.com', '229998', '2015-10-11 12:10:00')

-- ************************************** [INSERTS Transacao]
  
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(1, 1, '2020-01-01 12:00:00', 'Deposito', null, 500);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(2, 2, '2020-01-02 13:00:00', 'Deposito', null, 3000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(3, 3, '2020-01-03 14:00:00', 'Deposito', null, 1100);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(4, 4, '2020-01-04 12:30:00', 'Deposito', null, 100);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(5, 5, '2020-01-05 11:20:00', 'Deposito', null, 9000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(6, 6, '2020-01-06 12:45:00', 'Deposito', null, 119000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(7, 7, '2020-01-07 09:33:00', 'Deposito', null, 300);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(8, 8, '2020-01-08 15:15:00', 'Deposito', null, 350000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(9, 9, '2020-01-09 12:00:00', 'Deposito', null, 15000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(10, 10, '2020-01-10 11:35:00', 'Deposito', null, 58000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(11, 11, '2020-01-11 16:20:00', 'Deposito', null, 500);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(12, 12, '2020-01-12 16:00:00', 'Deposito', null, 600000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(13, 13, '2020-01-13 15:10:00', 'Deposito', null, 125000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(14, 14, '2020-01-14 15:18:00', 'Deposito', null, 5000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(15, 15, '2020-01-20 14:53:00', 'Deposito', null, 500);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(1, 11, '2022-10-10 10:45:00', 'PIX', null, 100);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(12, 7, '2022-10-11 11:50:00', 'PIX', null, 15000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(13, 4, '2022-10-12 11:12:00', 'PIX', null, 1000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(14, 11, '2022-10-13 14:14:00', 'PIX', null, 400);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(1, 11, '2022-10-14 09:00:00', 'Debito', null, 50);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(7, 7, '2022-11-15 09:10:00', 'Deposito', null, 3000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(8, 8, '2022-11-16 08:15:00', 'Deposito', null, 2200);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(12, 13, '2022-11-17 08:44:00', 'Credito', null, 150);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(12, 3, '2022-12-20 10:30:00', 'Debito', null, 10000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(13, 12, '2022-12-21 10:01:00', 'Debito', null, 9000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(6, 7, '2022-12-22 09:55:00', 'Debito', null, 200);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(7, 15, '2022-12-23 14:37:00', 'Debito', null, 1500);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(5, 4, '2022-12-02 16:48:00', 'Debito', null, 1500);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(2, 4, '2023-01-03 12:51:00', 'Credito', null, 800);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(6, 10, '2023-01-04 08:06:00', 'Credito', null, 750);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(10, 11, '2023-01-05 12:15:00', 'Credito', null, 500);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(15, 2, '2023-01-06 10:30:00', 'Credito', null, 3500);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(14, 4, '2023-01-07 09:30:00', 'Credito', null, 230);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(4, 4, '2023-01-06 09:09:00', 'Credito', null, 4500);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(15, 10, '2021-01-07 15:40:00', 'Credito', null, 230);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(2, 3, '2020-04-07 16:10:00', 'Transferencia', null, 330);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(12, 10, '2020-04-07 09:15:00', 'Transferencia', null, 420);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(8, 15, '2020-04-07 10:15:00', 'Transferencia', null, 130);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(10, 15, '2020-04-07 16:50:00', 'Transferencia', null, 730);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(5, 11, '2020-04-07 16:50:00', 'Transferencia', null, 1030);
  
-- ************************************** [INSERTS Cambio]

INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (6, 'BRL', 'USD', 3000, 0, getdate());
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (6, 'BRL', 'USD', 2000, 0, getdate());
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (6, 'USD', 'BRL', 300, 0, getdate());
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (12, 'BRL', 'USD', 8000, 0, getdate());
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (12, 'BRL', 'EUR', 15000, 0, getdate());
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (12, 'BRL', 'EUR', 30000, 0, getdate());
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (12, 'EUR', 'USD', 3500, 0, getdate());
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (12, 'BRL', 'USD', 25000, 0, getdate());
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (12, 'USD', 'BRL', 1000, 0, getdate());
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (12, 'BRL', 'EUR', 15000, 0, getdate());
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (12, 'USD', 'EUR', 800, 0, getdate());
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (10, 'BRL', 'EUR', 35000, 0, getdate());
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (10, 'BRL', 'EUR', 5000, 0, getdate());
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (10, 'EUR', 'BRL', 100, 0, getdate());
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (10, 'EUR', 'BRL', 650, 0, getdate());

-- ************************************** [INSERTS Investimento]

INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 6, 'LCA', 5300, 0, getdate())
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 2, 'Tesouro direto', 2000, 0, getdate())
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 4, 'LCI', 4500, 0, getdate())
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 12, 'Renda fixa', 5000, 0, getdate())
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 8, 'Tesouro direto', 55300, 0, getdate())
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 8, 'LCI', 30000, 0, getdate())
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 13, 'Tesouro direto', 25300, 0, getdate())
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 6, 'Renda fixa', 21300, 0, getdate())
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 15, 'LCA', 860, 0, getdate())
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 12, 'Renda fixa', 50000, 0, getdate())

-- ************************************** [INSERTS Emprestimo]

INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (1, 5, 5000, 1.15, getdate(), DATEADD(MINUTE, 4, GETDATE()), 0)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (0, 4, 1500, 1.15, getdate(), DATEADD(MINUTE, 5, GETDATE()), 0)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (0, 10, 4000, 1.15, getdate(), DATEADD(MINUTE, 6, GETDATE()), 0)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (0, 11, 1500, 1.15, getdate(), DATEADD(MINUTE, 7, GETDATE()), 0)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (1, 11, 2000, 1.15, getdate(), DATEADD(MINUTE, 8, GETDATE()), 0)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (0, 15, 3500, 1.15, getdate(), DATEADD(MINUTE, 9, GETDATE()), 0)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (0, 15, 3900, 1.15, getdate(), DATEADD(MINUTE, 10, GETDATE()), 0)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (1, 8, 15000, 1.25, getdate(), DATEADD(MINUTE, 11, GETDATE()), 0)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (0, 2, 10000, 1.15, getdate(), DATEADD(MINUTE, 12, GETDATE()), 0)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (0, 7, 700, 1.25, getdate(), DATEADD(MINUTE, 13, GETDATE()), 0)

-- ************************************** [INSERTS Cartao]

INSERT INTO Cartao (ativo, id_conta, numero, titular, dt_validade, code_sec)
VALUES (1, 12, '1234123412341234', 'Ana J da Silva', '2023-12-10', '7611')
INSERT INTO Cartao (ativo, id_conta, numero, titular, dt_validade, code_sec)
VALUES (1, 12, '4321432143214321', 'Ana J da Silva', '2031-10-28', '5212')
INSERT INTO Cartao (ativo, id_conta, numero, titular, dt_validade, code_sec)
VALUES (1, 8, '4444333322221111', 'Flavia Scussel', '2031-12-30', '3315')
INSERT INTO Cartao (ativo, id_conta, numero, titular, dt_validade, code_sec)
VALUES (1, 8, '1111222233334444', 'Flavia Scussel', '2032-12-10', '8911')
INSERT INTO Cartao (ativo, id_conta, numero, titular, dt_validade, code_sec)
VALUES (1, 2, '2222111133334444', 'Paulo Gomes', '2033-12-13', '1879')
INSERT INTO Cartao (ativo, id_conta, numero, titular, dt_validade, code_sec)
VALUES (0, 11, '5555666677778888', 'Giovanna Lambreta', '2029-10-20', '5126')
INSERT INTO Cartao (ativo, id_conta, numero, titular, dt_validade, code_sec)
VALUES (1, 11, '9999888877776666', 'Giovanna Lambreta', '2031-12-10', '6717')
INSERT INTO Cartao (ativo, id_conta, numero, titular, dt_validade, code_sec)
VALUES (0, 14, '5555333399997777', 'Chloe Regard', '2032-10-25', '1925')
INSERT INTO Cartao (ativo, id_conta, numero, titular, dt_validade, code_sec)
VALUES (0, 14, '1111222299998888', 'Chloe Regard', '2033-12-18', '1622')
INSERT INTO Cartao (ativo, id_conta, numero, titular, dt_validade, code_sec)
VALUES (1, 15, '4444222266661111', 'Wellington Trevoso', '2034-01-11', '8141')
