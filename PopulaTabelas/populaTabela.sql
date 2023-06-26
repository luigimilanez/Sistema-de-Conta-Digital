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
