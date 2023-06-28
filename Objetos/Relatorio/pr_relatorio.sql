/*----------------------------------------------------------
			Procedure: pr_relatorio
			 Processo: Gerar um relatório da conta digital
Parâmetros de entrada:
	   >       tipo: Tipo do relatório (1-Transacoes 
										2-emprestimos 
										3-fatura 
										4-investimentos)
	   >     dt_ini: Data inicial da busca
	   >     dt_fim: Data final da busca
	   > id_cliente: Id do cliente (OPCIONAL)
	   >    tp_tran: Tipo da transacao (OPCIONAL)
----------------------------------------------------------*/
CREATE or ALTER PROCEDURE pr_relatorio(@tipo       TINYINT       ,
									   @dt_ini     DATE          , 
									   @dt_fim     DATE          , 
									   @id_cliente INT     = null,
									   @tp_conta   VARCHAR(16) = null) AS
BEGIN
	IF @tipo = 1
	BEGIN
		select cl.id_cliente                as 'ID', 
			   cl.nome		                as 'Nome', 
			   co.tp_conta                  as 'Tp Conta', 
			   co.saldo_real				as 'Saldo Conta',
			   tr.id_trans                  as 'ID Tran',
			   tr.tp_trans                  as 'Tp Tran',
			   tr.status                    as 'Status',
			   FORMAT(tr.data,'dd/MM/yyyy') as 'Data',
			   FORMAT(tr.data,'hh:mm')      as 'Hora',
			   tr.valor                     as 'Valor'
		from transacao tr
		left join cliente cl
		on tr.id_cliente = cl.id_cliente
		left join conta co
		on co.id_cliente = cl.id_cliente
		where tr.data BETWEEN @dt_ini and DATEADD(day, 1, @dt_fim)
		AND cl.id_cliente = isnull(@id_cliente,cl.id_cliente)
		AND co.tp_conta = isnull(@tp_conta,co.tp_conta)
	END

	IF @tipo = 2
	BEGIN
		/*declare @tipo       TINYINT       ,
				@dt_ini     DATE          , 
				@dt_fim     DATE          , 
				@id_cliente INT     = null,
				@tp_tran    VARCHAR(16) = null;
		
		select @dt_ini = '2020-01-01';
		select @dt_fim = '2021-01-04';*/

		select em.id_conta                              as 'ID',
			   cl.nome                                  as 'Nome',
			   co.tp_conta                              as 'Tp Conta',
			   co.saldo_real                            as 'Saldo Conta',
			   FORMAT(em.data_contratacao,'dd/MM/yyyy') as 'Dt Contratacao',
			   FORMAT(em.data_venc,'dd/MM/yyyy')	    as 'Dt Vencimento',
			   em.valor_emprest                         as 'Valor Emprest.',
			   em.saldo_devedor                         as 'Saldo Devedor'
		from emprestimo em
		inner join conta co
		on co.id_conta = em.id_conta
		inner join cliente cl
		on cl.id_cliente = co.id_cliente
		where em.data_contratacao BETWEEN @dt_ini and DATEADD(day, 1, @dt_fim)
		AND cl.id_cliente = isnull(@id_cliente,cl.id_cliente)
		AND co.tp_conta = isnull(@tp_conta,co.tp_conta);
	END

	IF @tipo = 3
	BEGIN
		select fa.id_conta                              as 'ID',
			   cl.nome                                  as 'Nome',
			   co.tp_conta                              as 'Tp Conta',
			   co.saldo_real                            as 'Saldo Conta',
			   fa.valor									as 'Fatura',
			   FORMAT(fa.dt_venc,'dd/MM/yyyy')          as 'Dt Venci'
		from fatura fa
		left join conta co
		on co.id_conta = fa.id_conta
		left join cliente cl
		on cl.id_cliente = co.id_cliente
	END

	IF @tipo = 4
	BEGIN
		select inv.id_conta                          as 'ID',
			   cl.nome                               as 'Nome',
			   co.tp_conta                           as 'Tp Conta',
			   co.saldo_real                         as 'Saldo Conta',
			   inv.id_invest						 as 'Cod Invest',
			   inv.tp_investimento                   as 'Tp Invest',
			   FORMAT(inv.dt_aplicacao,'dd/MM/yyyy') as 'Dt Aplicacao',
			   inv.vlr_investido					 as 'Valor Invest',
			   inv.vlr_rendimento					 as 'Valor Rendim'
		from investimento inv
		left join conta co
		on co.id_conta = inv.id_conta
		left join cliente cl
		on cl.id_cliente = co.id_cliente
		where inv.dt_aplicacao BETWEEN @dt_ini and DATEADD(day, 1, @dt_fim)
		AND cl.id_cliente = isnull(@id_cliente,cl.id_cliente)
		AND co.tp_conta = isnull(@tp_conta,co.tp_conta);
	END
END

exec pr_relatorio 1, '2010-01-01', '2030-01-06'
