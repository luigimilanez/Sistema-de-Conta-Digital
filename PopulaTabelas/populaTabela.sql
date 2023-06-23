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
VALUES (0, 'Gustavo Nava', '22211133344', '1981-11-26', '993218765', 'Florianopolis', 'gustavonava998@gmail.com', '876876', '2023-01-01 16:50:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Danilo Guindaste', '66655543422', '1999-12-17', '940028922', 'Criciuma', 'daniloguindastez@gmail.com', '554281', '2015-02-05 09:30:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Flavia Scussel', '88776655443', '1982-10-07', '911118888', 'Sideropolis', 'flaviascussel982@gmail.com', '123888', '2019-12-18 11:30:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (0, 'Valeria Alavanca', '77711133344', '1989-08-21', '988877799', 'Sideropolis', 'valeriaalavanca@gmail.com', '332255', '2020-01-25 10:42:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (0, 'Lucia Mattos', '77754522871', '1976-05-05', '917284928', 'Florianopolis', 'luciamattosxd@gmail.com', '102876', '2014-03-27 14:15:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Giovanna Lambreta', '33322288865', '2000-10-28', '999955555', 'Treviso', 'giovannalambreta322@gmail.com', '444555', '2014-06-18 10:55:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Ana Julia da Silva', '98172312344', '1995-06-16', '922448877', 'Criciuma', 'anajsilva1@gmail.com', '776612', '2015-01-01 17:00:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Eliana Demencio', '22211111144', '1980-01-25', '987658765', 'Laguna', 'elianademencio98@gmail.com', '325466', '2016-06-16 16:16:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (0, 'Chloe Regard', '98798798711', '2001-12-25', '999886251', 'Laguna', 'chloeregard123@gmail.com', '887123', '2017-07-21 14:10:00')
INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao)
VALUES (1, 'Wellington Trevoso', '12333377712', '1996-07-07', '99940028911', 'Sideropolis', 'wellingtonmetaleiro@gmail.com', '229998', '2015-10-11 12:10:00')

-- ************************************** [INSERTS Cambio]

INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (6, 'Real', 'Dolar', 3000, 628, '2023-01-28');
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (6, 'Real', 'Dolar', 2000, 418, '2023-02-01');
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (6, 'Real', 'Dolar', 7000, 1465, '2023-03-15');
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (12, 'Real', 'Dolar', 8000, 1675, '2023-03-15');
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (12, 'Real', 'Euro', 15000, 2876, '2016-01-05');
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (12, 'Real', 'Euro', 30000, 5752, '2017-11-10');
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (12, 'Real', 'Euro', 35000, 6711, '2018-10-15');
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (12, 'Real', 'Dolar', 25000, 5235, '2018-01-03');
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (12, 'Real', 'Dolar', 28000, 5863, '2019-05-15');
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (12, 'Real', 'Euro', 15000, 2876, '2020-07-10');
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (12, 'Real', 'Dolar', 10000, 2094, '2023-06-10');
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (10, 'Real', 'Euro', 35000, 6711, '2013-01-15');
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (10, 'Real', 'Euro', 35000, 6711, '2014-06-15');
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (10, 'Real', 'Euro', 35000, 6711, '2015-01-15');
INSERT INTO Cambio (id_conta, moeda_origem, moeda_dest, valor_origem, valor_dest, dt_cambio)
VALUES (10, 'Real', 'Euro', 35000, 6711, '2016-06-15');

-- ************************************** [INSERTS Investimento]

INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 6, 'lca', 5300, 150, '2020-12-29')
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 2, 'tesouro_direto', 23000, 500, '2021-04-01')
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 4, 'lci', 10000, 690, '2020-06-01')
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 4, 'renda_fixa', 5000, 250, '2020-12-29')
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 8, 'tesouro_direto', 55300, 4000, '2020-03-02')
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 8, 'lca', 230000, 40000, '2020-01-15')
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 13, 'tesouro_direto', 25300, 35000, '2016-12-29')
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 13, 'renda_fixa', 21300, 45000, '2017-12-29')
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 12, 'lca', 1081300, 598000, '2016-12-29')
INSERT INTO Investimento (ativo, id_conta, tp_investimento, vlr_investido, vlr_rendimento, dt_aplicacao)
VALUES (1, 12, 'renda_fixa', 800000, 465000, '2017-12-29')

-- ************************************** [INSERTS Emprestimo]

INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (1, 5, 5000, 1.15, '2023-05-27', '2023-08-27', 5750)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (0, 4, 1500, 1.15, '2019-05-07', '2019-08-07', 1725)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (0, 10, 4000, 1.15, '2015-03-21', '2015-06-21', 4600)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (0, 11, 4500, 1.15, '2016-02-10', '2016-05-10', 5175)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (1, 11, 5000, 1.15, '2023-04-05', '2023-10-05', 5750)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (0, 15, 3500, 1.15, '2016-01-20', '2018-04-20', 4025)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (0, 15, 3900, 1.15, '2018-06-01', '2018-09-01', 4485)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (1, 8, 15000, 1.25, '2023-04-04', '2024-04-04', 18750)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (0, 2, 10000, 1.15, '2021-11-11', '2022-02-11', 11500)
INSERT INTO Emprestimo (ativo, id_conta, valor_emprest, taxa_juros, data_contratacao, data_venc, saldo_devedor)
VALUES (0, 7, 17000, 1.25, '2017-06-25', '2018-06-25', 21250)

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

-- ************************************** [INSERTS Transacao]
  
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(1, 1, '2020-01-01 12:00:00', 'Deposito', 'Aprovado', 500);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(2, 2, '2020-01-02 13:00:00', 'Deposito', 'Aprovado', 3000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(3, 3, '2020-01-03 14:00:00', 'Deposito', 'Aprovado', 1100);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(4, 4, '2020-01-04 12:30:00', 'Deposito', 'Aprovado', 100);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(5, 5, '2020-01-05 11:20:00', 'Deposito', 'Aprovado', 9000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(6, 6, '2020-01-06 12:45:00', 'Deposito', 'Aprovado', 89000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(7, 7, '2020-01-07 09:33:00', 'Deposito', 'Aprovado', 300);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(8, 8, '2020-01-08 15:15:00', 'Deposito', 'Aprovado', 150000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(9, 9, '2020-01-09 12:00:00', 'Deposito', 'Aprovado', 15000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(10, 10, '2020-01-10 11:35:00', 'Deposito', 'Aprovado', 58000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(11, 11, '2020-01-11 16:20:00', 'Deposito', 'Aprovado', 500);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(12, 12, '2020-01-12 16:00:00', 'Deposito', 'Aprovado', 200000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(13, 13, '2020-01-13 15:10:00', 'Deposito', 'Aprovado', 45000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(14, 14, '2020-01-14 15:18:00', 'Deposito', 'Aprovado', 500);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(15, 15, '2020-01-20 14:53:00', 'Deposito', 'Aprovado', 500);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(1, 11, '2022-10-10 10:45:00', 'PIX', 'Aprovado', 1000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(11, 7, '2022-10-11 11:50:00', 'PIX', 'Aprovado', 15000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(13, 4, '2022-10-12 11:12:00', 'PIX', 'Aprovado', 1000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(14, 11, '2022-10-13 14:14:00', 'PIX', 'Aprovado', 400);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(1, 11, '2022-10-14 09:00:00', 'Debito', 'Aprovado', 50);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(7, 7, '2022-11-15 09:10:00', 'Deposito', 'Negado', 3000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(8, 8, '2022-11-16 08:15:00', 'Deposito', 'Aprovado', 2200);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(13, 13, '2022-11-17 08:44:00', 'Credito', 'Aprovado', 150);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(11, 11, '2022-11-18 13:45:00', 'Credito', 'Aprovado', 3300);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(1, 11, '2022-11-19 15:31:00', 'Debito', 'Aprovado', 1000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(7, 3, '2022-12-20 10:30:00', 'Debito', 'Negado', 10000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(11, 12, '2022-12-21 10:01:00', 'Debito', 'Aprovado', 9000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(6, 7, '2022-12-22 09:55:00', 'Debito', 'Aprovado', 200);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(15, 7, '2022-12-23 14:37:00', 'Debito', 'Negado', 1000);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(4, 4, '2022-12-02 16:48:00', 'Debito', 'Aprovado', 1500);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(2, 4, '2023-01-03 12:51:00', 'Credito', 'Aprovado', 800);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(6, 10, '2023-01-04 08:06:00', 'Credito', 'Aprovado', 750);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(10, 11, '2023-01-05 12:15:00', 'Credito', 'Aprovado', 500);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(15, 2, '2023-01-06 10:30:00', 'Credito', 'Aprovado', 3500);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(14, 4, '2023-01-07 09:30:00', 'Credito', 'Aprovado', 230);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(4, 4, '2023-01-06 09:09:00', 'Credito', 'Aprovado', 4500);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(15, 10, '2021-01-07 15:40:00', 'Credito', 'Negado', 230);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(2, 3, '2020-04-07 16:10:00', 'Transferencia', 'Negado', 330);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(12, 10, '2020-04-07 09:15:00', 'Transferencia', 'Aprovado', 420);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(8, 15, '2020-04-07 10:15:00', 'Transferencia', 'Aprovado', 130);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(14, 15, '2020-04-07 16:50:00', 'Transferencia', 'Aprovado', 730);
INSERT INTO Transacao (id_conta, id_cliente, data, tp_trans, status, valor)
VALUES(5, 11, '2020-04-07 16:50:00', 'Transferencia', 'Negado', 1030);

-- ************************************** [INSERTS Fatura]

INSERT INTO Fatura (ativo, id_trans, id_conta, valor, valor_emprest, dt_venc)
VALUES (0, 7, 6, 150, 0, '2022-04-21 00:00:00')
INSERT INTO Fatura (ativo, id_trans, id_conta, valor, valor_emprest, dt_venc)
VALUES (1, 8, 1, 4000, 0, '2022-04-22 00:00:00')
INSERT INTO Fatura (ativo, id_trans, id_conta, valor, valor_emprest, dt_venc)
VALUES (0, 16, 2, 1500, 0, '2022-05-21 00:00:00')
INSERT INTO Fatura (ativo, id_trans, id_conta, valor, valor_emprest, dt_venc)
VALUES (1, 17, 6, 800, 0, '2022-06-24 00:00:00')
INSERT INTO Fatura (ativo, id_trans, id_conta, valor, valor_emprest, dt_venc)
VALUES (1, 18, 10, 750, 0, '2022-06-24 00:00:00')
INSERT INTO Fatura (ativo, id_trans, id_conta, valor, valor_emprest, dt_venc)
VALUES (1, 19, 15, 500, 0, '2022-07-20 00:00:00')
INSERT INTO Fatura (ativo, id_trans, id_conta, valor, valor_emprest, dt_venc)
VALUES (1, 20, 14, 3500, 0, '2022-08-23 00:00:00')
INSERT INTO Fatura (ativo, id_trans, id_conta, valor, valor_emprest, dt_venc)
VALUES (1, 21, 6, 230, 0, '2022-12-15 00:00:00')
INSERT INTO Fatura (ativo, id_trans, id_conta, valor, valor_emprest, dt_venc)
VALUES (0, 3, 6, 1000, 0, '2021-11-24 00:00:00')
INSERT INTO Fatura (ativo, id_trans, id_conta, valor, valor_emprest, dt_venc)
VALUES (0, 4, 6, 150, 0, '2021-06-15 00:00:00')
