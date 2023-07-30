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
 [id_log]       int IDENTITY ,
 [regist_delet] varchar(max) NOT NULL ,


 CONSTRAINT [pk_log_cliente_deletado] PRIMARY KEY CLUSTERED ([id_log] ASC)
);
GO