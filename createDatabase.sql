-- ************************************** [Cliente]
CREATE TABLE [Cliente]
(
 [id_cliente] int NOT NULL ,
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
 [id_conta]    int NOT NULL ,
 [id_cliente]  int NOT NULL ,
 [tp_conta]    varchar(64) NOT NULL ,
 [saldo_real]  numeric(14,2) NOT NULL ,
 [saldo_dolar] numeric(14,2) NULL ,
 [saldo_euro]  numeric(14,2) NULL ,
 [lim_credito] numeric(14,2) NOT NULL ,
 [lim_emprest] numeric(14,2) NOT NULL ,


 CONSTRAINT [pk_Conta] PRIMARY KEY CLUSTERED ([id_conta] ASC),
 CONSTRAINT [fk_Cliente__Conta] FOREIGN KEY ([id_cliente])  REFERENCES [Cliente]([id_cliente])
);
GO


CREATE NONCLUSTERED INDEX [fk_Cliente__Conta] ON [Conta] 
 (
  [id_cliente] ASC
 )

GO


-- ************************************** [Cambio]
CREATE TABLE [Cambio]
(
 [id_cambio]    int NOT NULL ,
 [id_conta]     int NOT NULL ,
 [moeda_origem] varchar(10) NOT NULL ,
 [moeda_dest]   varchar(10) NOT NULL ,
 [valor_origem] numeric(14,2) NOT NULL ,
 [valor_dest]   numeric(14,2) NOT NULL ,
 [dt_cambio]    date NOT NULL ,


 CONSTRAINT [pk_Cambio] PRIMARY KEY CLUSTERED ([id_cambio] ASC),
 CONSTRAINT [fk_Conta__Cambio] FOREIGN KEY ([id_conta])  REFERENCES [Conta]([id_conta])
);
GO


CREATE NONCLUSTERED INDEX [fk_Conta__Cambio] ON [Cambio] 
 (
  [id_conta] ASC
 )

GO


-- ************************************** [Transacao]
CREATE TABLE [Transacao]
(
 [id_trans] int NOT NULL ,
 [id_conta] int NOT NULL ,
 [data]     datetime NOT NULL ,
 [tp_trans] varchar(64) NOT NULL ,
 [valor]    numeric(14,2) NOT NULL ,


 CONSTRAINT [pk_Transacao] PRIMARY KEY CLUSTERED ([id_trans] ASC),
 CONSTRAINT [fk_Conta__Transacao] FOREIGN KEY ([id_conta])  REFERENCES [Conta]([id_conta])
);
GO


CREATE NONCLUSTERED INDEX [fk_Conta__Transacao] ON [Transacao] 
 (
  [id_conta] ASC
 )

GO


-- ************************************** [Emprestimo]
CREATE TABLE [Emprestimo]
(
 [id_emprest]       int NOT NULL ,
 [id_conta]         int NOT NULL ,
 [valor]            numeric(14,2) NOT NULL ,
 [taxa_juros]       tinyint NOT NULL ,
 [data_contratacao] date NOT NULL ,
 [data_venc]        date NOT NULL ,


 CONSTRAINT [pk_Emprestimo] PRIMARY KEY CLUSTERED ([id_emprest] ASC),
 CONSTRAINT [fk_Conta__Emprestimo] FOREIGN KEY ([id_conta])  REFERENCES [Conta]([id_conta])
);
GO


CREATE NONCLUSTERED INDEX [fk_Conta__Emprestimo] ON [Emprestimo] 
 (
  [id_conta] ASC
 )

GO


-- ************************************** [Investimento]
CREATE TABLE [Investimento]
(
 [id_invest]       int NOT NULL ,
 [id_conta]        int NOT NULL ,
 [tp_investimento] varchar(64) NOT NULL ,
 [vlr_investido]   numeric(14,2) NOT NULL ,
 [vlr_rendimento]  numeric(14,2) NULL ,
 [dt_aplicacao]    date NOT NULL ,


 CONSTRAINT [pk_Investimento] PRIMARY KEY CLUSTERED ([id_invest] ASC),
 CONSTRAINT [fk_Conta__Investimento] FOREIGN KEY ([id_conta])  REFERENCES [Conta]([id_conta])
);
GO


CREATE NONCLUSTERED INDEX [fk_Conta__Investimento] ON [Investimento] 
 (
  [id_conta] ASC
 )

GO


-- ************************************** [Cartao]
CREATE TABLE [Cartao]
(
 [id_cartao]   int NOT NULL ,
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


CREATE NONCLUSTERED INDEX [fk_Conta__Cartao] ON [Cartao] 
 (
  [id_conta] ASC
 )

GO


-- ************************************** [Fatura]
CREATE TABLE [Fatura]
(
 [id_fatura] int NOT NULL ,
 [id_conta]  int NOT NULL ,
 [id_cartao] int NOT NULL ,
 [valor]     numeric(14,2) NOT NULL ,
 [dt_venc]   date NOT NULL ,


 CONSTRAINT [pk_Fatura] PRIMARY KEY CLUSTERED ([id_fatura] ASC),
 CONSTRAINT [fk_Cartao__Fatura] FOREIGN KEY ([id_cartao])  REFERENCES [Cartao]([id_cartao]),
 CONSTRAINT [fk_Conta__Fatura] FOREIGN KEY ([id_conta])  REFERENCES [Conta]([id_conta])
);
GO


CREATE NONCLUSTERED INDEX [fk_Cartao__Fatura] ON [Fatura] 
 (
  [id_cartao] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fk_Conta__Fatura] ON [Fatura] 
 (
  [id_conta] ASC
 )

GO


-- ************************************** [Pagamento]
CREATE TABLE [Pagamento]
(
 [id_pagamento]  int NOT NULL ,
 [id_conta]      int NOT NULL ,
 [id_cliente]    int NOT NULL ,
 [id_trans]      int NOT NULL ,
 [valor]         numeric(14,2) NOT NULL ,
 [dt_vencimento] date NOT NULL ,
 [status]        varchar(35) NOT NULL ,


 CONSTRAINT [pk_Pagamento] PRIMARY KEY CLUSTERED ([id_pagamento] ASC),
 CONSTRAINT [fk_Cliente__Pagamento] FOREIGN KEY ([id_cliente])  REFERENCES [Cliente]([id_cliente]),
 CONSTRAINT [fk_Conta__Pagamento] FOREIGN KEY ([id_conta])  REFERENCES [Conta]([id_conta]),
 CONSTRAINT [fk_Transacao__Pagamento] FOREIGN KEY ([id_trans])  REFERENCES [Transacao]([id_trans])
);
GO


CREATE NONCLUSTERED INDEX [fk_Cliente__Pagamento] ON [Pagamento] 
 (
  [id_cliente] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fk_Conta__Pagamento] ON [Pagamento] 
 (
  [id_conta] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fk_Transacao__Pagamento] ON [Pagamento] 
 (
  [id_trans] ASC
 )

GO