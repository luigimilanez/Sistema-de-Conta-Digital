import pyodbc
import datetime
from time import sleep as s
from PyQt5 import uic, QtWidgets
import sys

 
# Conexão
def conexao():
    try:
        server = 'NOME.database.windows.net'
        database = 'NOME-DATABASE'
        username = 'USUARIO'
        password = 'SENHA'
        driver = '{ODBC Driver 18 for SQL Server}'  # Pode variar dependendo do driver instalado
        
        connection_string = f"DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password}"
        
        connection = pyodbc.connect(connection_string)
        
        return connection
    except:
        print('Erro de conexão com o banco de dados')
        s(10)  # aguarda 10 segundos
        exit()  # fecha o programa
 

def insert(nome, cpf, datanasc, telefone, endereco, email, senha):  # insert
    # Abre conexao com o banco
    cursor = conexao().cursor()
 
    try:
        cursor.execute(f"SELECT * FROM Cliente WHERE cpf = '{cpf}' or phone = '{telefone}' or email = '{email}'")
        contador = cursor.fetchone()[0]  # Verifica se possui registro
        cursor.close()
 
        if contador > 0:
            return 'Este cliente já existe na tabela'
    except:
        query = '''INSERT INTO Cliente (ativo, nome, cpf, data_nasc, phone, endereco, email, senha, dt_criacao) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)'''
        cursor.execute(query, [1, nome, cpf, datanasc, telefone, endereco, email, senha, datetime.date.today()])
        cursor.commit()
        print('Dado inserido com sucesso!')
        cursor.close()
 
 
# Pensar posteriormente na possibilidade de desativar uma conta (mudar UI tbm)
def update_table(id, nome, telefone, endereco, email, senha):
    try:
        cursor = conexao().cursor()
        cursor.execute(f"UPDATE Cliente SET nome = '{nome}', phone = '{telefone}', endereco = '{endereco}', email = '{email}', senha = '{senha}' WHERE id_cliente = {id}")
        cursor.commit()
        print('Dado atualizado com sucesso!')
        cursor.close()
    except:
        return 'Algum dado é repetido com o de outro cliente'
 
# Necessario a trigger no banco de dados
def delete(id):
    cursor = conexao().cursor()
    cursor.execute(f"DELETE Cliente WHERE id_cliente = {id}")
    cursor.commit()
    print('Cliente deletado com sucesso!')
    cursor.close()
 
 
# print(delete(2))
 
 
def read_all():
    try:
        query = 'SELECT * FROM Cliente'
 
        cursor = conexao().cursor()
        cursor.execute(query)
 
        rows = cursor.fetchall()
        cursor.close()
 
        return rows
    except:
        print('Falha na conexão com o banco')
 
# print(len(read_all()))
 
def read_one_id(idcliente):
    try:
        query = f'SELECT * FROM Cliente WHERE id_cliente = {idcliente}'
 
        cursor = conexao().cursor()
        cursor.execute(query)
 
        row = cursor.fetchall()
        cursor.close()
 
        return row
    except:
        print('Falha na conexão com o banco')
 
 
def read_one_nome(nome):
    try:
        query = f"SELECT * FROM Cliente WHERE nome like '{nome}%'"
 
        cursor = conexao().cursor()
        cursor.execute(query)
 
        row = cursor.fetchall()
        cursor.close()
 
        return row
    except:
        print('Falha na conexão com o banco')
 
 
def read_one_cpf(cpf):
    try:
        query = f"SELECT * FROM Cliente WHERE cpf like '{cpf}%'"
 
        cursor = conexao().cursor()
        cursor.execute(query)
 
        row = cursor.fetchall()
        cursor.close()
 
        return row
    except:
        print('Falha na conexão com o banco')
 
 
def read_one_telefone(telefone):
    try:
        query = f"SELECT * FROM Cliente WHERE phone like '{telefone}%'"
 
        cursor = conexao().cursor()
        cursor.execute(query)
 
        row = cursor.fetchall()
        cursor.close()
 
        return row
    except:
        print('Falha na conexão com o banco')
 
 
def read_one_email(email):
    try:
        query = f"SELECT * FROM Cliente WHERE email like '{email}%'"
 
        cursor = conexao().cursor()
        cursor.execute(query)
 
        row = cursor.fetchall()
        cursor.close()
 
        return row
    except:
        print('Falha na conexão com o banco')
 
 
def read_one_endereco(endereco):
    try:
        query = f"SELECT * FROM Cliente WHERE endereco like '{endereco}%'"
 
        cursor = conexao().cursor()
        cursor.execute(query)
 
        row = cursor.fetchall()
        cursor.close()
 
        return row
    except:
        print('Falha na conexão com o banco')
 
 
# Janela gerenciamento de clientes
def pesquisar():
    # atualizando todos os registros
    if tela_cadastro.opt_todos.isChecked():
        tela_cadastro.barra_pesquisa.setText('')
        atualiza_tabela_principal()
        return
 
    # Verificando se o texto da caixa pesquisa esta vazio
    pesquisa = tela_cadastro.barra_pesquisa.text()
    if pesquisa.strip() == '':
        QtWidgets.QMessageBox.about(tela_cadastro, 'Alerta', 'Por favor digite um valor para a pesquisa')
        return
 
    if tela_cadastro.opt_id.isChecked():
        try:
            id_cliente = int(pesquisa)
        except:
            QtWidgets.QMessageBox.about(tela_cadastro, 'Alerta', 'Por favor digite um valor inteiro para pesquisar por id')
            return 
 
        # Pesquisa no banco de dados
        rows = read_one_id(id_cliente)
        if rows == None:
            QtWidgets.QMessageBox.about(tela_cadastro, 'Alerta', 'Valor não encontrado na tabela')
            return
 
        limpa_tabela(len(rows))
        for i in range(len(rows)): #linha
            for j in range(len(rows[0])): #coluna
                item = QtWidgets.QTableWidgetItem(f"{rows[i][j]}")
                tela_cadastro.tabela.setItem(i,j, item)
        # Fim radio button id aluno
 
 
    if tela_cadastro.opt_nome.isChecked():
        try:
            nome = pesquisa
        except:
            QtWidgets.QMessageBox.about(tela_cadastro, 'Alerta', 'Por favor digite um valor inteiro para pesquisar por id')
            return 
 
        # Pesquisa no banco de dados
        rows = read_one_nome(nome)
        if rows == None:
            QtWidgets.QMessageBox.about(tela_cadastro, 'Alerta', 'Valor não encontrado na tabela')
            return
 
        limpa_tabela(len(rows))
        for i in range(len(rows)): #linha
            for j in range(len(rows[0])): #coluna
                item = QtWidgets.QTableWidgetItem(f"{rows[i][j]}")
                tela_cadastro.tabela.setItem(i,j, item)
        # Fim radio button nome
 
 
    if tela_cadastro.opt_cpf.isChecked():
        try:
            cpf = pesquisa
        except:
            QtWidgets.QMessageBox.about(tela_cadastro, 'Alerta', 'Por favor digite um valor inteiro para pesquisar por id')
            return 
 
        # Pesquisa no banco de dados
        rows = read_one_cpf(cpf)
        if rows == None:
            QtWidgets.QMessageBox.about(tela_cadastro, 'Alerta', 'Valor não encontrado na tabela')
            return
 
        limpa_tabela(len(rows))
        for i in range(len(rows)): #linha
            for j in range(len(rows[0])): #coluna
                item = QtWidgets.QTableWidgetItem(f"{rows[i][j]}")
                tela_cadastro.tabela.setItem(i,j, item)
        # Fim radio button cpf
 
 
    if tela_cadastro.opt_telefone.isChecked():
        try:
            telefone = pesquisa
        except:
            QtWidgets.QMessageBox.about(tela_cadastro, 'Alerta', 'Por favor digite um valor inteiro para pesquisar por id')
            return 
 
        # Pesquisa no banco de dados
        rows = read_one_telefone(telefone)
        if rows == None:
            QtWidgets.QMessageBox.about(tela_cadastro, 'Alerta', 'Valor não encontrado na tabela')
            return
 
        limpa_tabela(len(rows))
        for i in range(len(rows)): #linha
            for j in range(len(rows[0])): #coluna
                item = QtWidgets.QTableWidgetItem(f"{rows[i][j]}")
                tela_cadastro.tabela.setItem(i,j, item)
        # Fim radio button telefone
 
 
    if tela_cadastro.opt_email.isChecked():
        try:
            email = pesquisa
        except:
            QtWidgets.QMessageBox.about(tela_cadastro, 'Alerta', 'Por favor digite um valor inteiro para pesquisar por id')
            return 
 
        # Pesquisa no banco de dados
        rows = read_one_email(email)
        if rows == None:
            QtWidgets.QMessageBox.about(tela_cadastro, 'Alerta', 'Valor não encontrado na tabela')
            return
 
        limpa_tabela(len(rows))
        for i in range(len(rows)): #linha
            for j in range(len(rows[0])): #coluna
                item = QtWidgets.QTableWidgetItem(f"{rows[i][j]}")
                tela_cadastro.tabela.setItem(i,j, item)
        # Fim radio button email
 
 
    if tela_cadastro.opt_endereco.isChecked():
        try:
            endereco = pesquisa
        except:
            QtWidgets.QMessageBox.about(tela_cadastro, 'Alerta', 'Por favor digite um valor inteiro para pesquisar por id')
            return 
 
        # Pesquisa no banco de dados
        rows = read_one_endereco(endereco)
        if rows == None:
            QtWidgets.QMessageBox.about(tela_cadastro, 'Alerta', 'Valor não encontrado na tabela')
            return
 
        limpa_tabela(len(rows))
        for i in range(len(rows)): #linha
            for j in range(len(rows[0])): #coluna
                item = QtWidgets.QTableWidgetItem(f"{rows[i][j]}")
                tela_cadastro.tabela.setItem(i,j, item)
        # Fim radio button endereco
 
 
def limpa_tabela(valor):
    # Valor é o valor de linhas que terá a tabela
    if valor == 1:
        tela_cadastro.tabela.setRowCount(1)
        tela_cadastro.tabela.setColumnCount(len(read_all()[0]))
        tela_cadastro.tabela.setHorizontalHeaderLabels(["ID", "Ativo", "Nome", "CPF", "DataNasc", "Telefone", "Endereco", "Email", "Senha", "Dt_criacao"])
    else:
        tela_cadastro.tabela.setRowCount(valor)
        tela_cadastro.tabela.setColumnCount(len(read_all()[0]))
        tela_cadastro.tabela.setHorizontalHeaderLabels(["ID", "Ativo", "Nome", "CPF", "DataNasc", "Telefone", "Endereco", "Email", "Senha", "Dt_criacao"])
 
 
def sair():
    tela_inserir_cliente.close()
    tela_cadastro.close()
 
 
def atualiza_tabela_principal():
    # Setando numero de linhas, colunas e nome das colunas
    # Linha abaixo está com erro de len: n é compativel com o len
    tela_cadastro.tabela.setRowCount(len(read_all()))
    tela_cadastro.tabela.setColumnCount(len(read_all()[0]))
    tela_cadastro.tabela.setHorizontalHeaderLabels(["ID", "Ativo", "Nome", "CPF", "DataNasc", "Telefone", "Endereco", "Email", "Senha", "Dt_criacao"])
 
    # Inserindo os dados na tabela
    rows = read_all()
 
    for i in range(len(rows)): #linha
        for j in range(len(rows[0])): #coluna
            item = QtWidgets.QTableWidgetItem(f"{rows[i][j]}")
            tela_cadastro.tabela.setItem(i,j, item)
# Fim janela janela gerenciamento de clientes
 
 
def abrir_janela_inserir():
    tela_inserir_cliente.show()
 
 
def fechar_janela_inserir():
    atualiza_tabela_principal()
    tela_inserir_cliente.input_nome.setText('')
    tela_inserir_cliente.input_cpf.setText('')
    tela_inserir_cliente.input_dtnasc.setText('')
    tela_inserir_cliente.input_telefone.setText('')
    tela_inserir_cliente.input_endereco.setText('')
    tela_inserir_cliente.input_email.setText('')
    tela_inserir_cliente.input_senha.setText('')
    tela_inserir_cliente.close()
 
 
def inserir_dados():
 
    # carcteresEspeciais = "!@#$%¨&*()-=+[]"
 
    try:
        # Resgatando o valor dos campos de texto da janela inserir
        nome = tela_inserir_cliente.input_nome.text()
        cpf = tela_inserir_cliente.input_cpf.text()
        dtnasc = tela_inserir_cliente.input_dtnasc.text()
        telefone = tela_inserir_cliente.input_telefone.text()
        endereco = tela_inserir_cliente.input_endereco.text()
        email = tela_inserir_cliente.input_email.text()
        senha = tela_inserir_cliente.input_senha.text()
 
        # Verificacao de inputs vazios
        if nome.strip() == '' or cpf.strip() == '' or dtnasc.strip() == '' or telefone.strip() == '' or endereco == '' or email.strip == '' or senha.strip() == '':
            QtWidgets.QMessageBox.about(tela_inserir_cliente, 'Erro', 'Por favor preencha todos os campos antes de inserir')
            return
 
        # cursor = conexao().cursor()
        # cursor.execute(f"SELECT * FROM Cliente WHERE cpf = '{cpf}' or phone = '{telefone}' or email = '{email}'")
        # resposta = cursor.fetchall()
        # cursor.close()

        # if not resposta:
        #     QtWidgets.QMessageBox.about(tela_inserir_cliente, 'Erro', 'Já existe um registro com esses dados!')
        #     return
    
        # Parte da inserção no banco de dados
        resposta = insert(nome, cpf, dtnasc, telefone, endereco, email, senha)
        atualiza_tabela_principal()
    
        QtWidgets.QMessageBox.about(tela_inserir_cliente, 'Success', 'Dados inseridos com sucesso!')        

    except:
        QtWidgets.QMessageBox.about(tela_inserir_cliente, 'Erro', 'Algum erro inesperado aconteceu')
        return
 
def abrir_janela_atualizar():
    tela_atualizar.show()
 
 
def fechar_janela_atualizar():
    atualiza_tabela_principal()
    tela_atualizar.input_idcliente.setText('')
    tela_atualizar.input_nomecliente.setText('')
    tela_atualizar.input_telefone.setText('')
    tela_atualizar.input_endereco.setText('')
    tela_atualizar.input_email.setText('')
    tela_atualizar.input_senha.setText('')
    tela_atualizar.close()
 
 
def atualizar_dados():
 
    try:
        id = tela_atualizar.input_idcliente.text()
        nome = tela_atualizar.input_nomecliente.text()
        telefone = tela_atualizar.input_telefone.text()
        endereco = tela_atualizar.input_endereco.text()
        email = tela_atualizar.input_email.text()
        senha = tela_atualizar.input_senha.text()
 
        # Verificacao de inputs vazios
        if id.strip() == '' or nome.strip() == '' or telefone.strip() == '' or endereco == '' or email.strip == '' or senha.strip() == '':
            QtWidgets.QMessageBox.about(tela_atualizar, 'Erro', 'Por favor preencha todos os campos antes de inserir')
            return
 
        resposta = update_table(int(id), nome, telefone, endereco, email, senha)
        atualiza_tabela_principal()
        QtWidgets.QMessageBox.about(tela_atualizar, 'Success', 'Atualização feita com sucesso')
 
        #return
 
    except:
        QtWidgets.QMessageBox.about(tela_atualizar, 'Erro', 'Algum erro inesperado aconteceu')
        return
 
 
def abrir_janela_excluir():
    tela_excluir.show()
 
 
def fechar_janela_excluir():
    atualiza_tabela_principal()
    tela_excluir.input_idcliente.setText('')
    tela_excluir.close()
 
 
def excluir_dados():
    try:
        id = tela_excluir.input_idcliente.text()
        if id.strip() == '':
            QtWidgets.QMessageBox.about(tela_excluir, 'Erro', 'Por favor preencha todos os campos antes de inserir')
            return
 
        resposta = delete(id)
        atualiza_tabela_principal()
        QtWidgets.QMessageBox.about(tela_excluir, 'Success', 'Registro excluido com sucesso')
    except:
        QtWidgets.QMessageBox.about(tela_excluir, 'Erro', 'Algum erro inesperado aconteceu')
        return
    

# Carregando minhas janelas que serão usadas
app = QtWidgets.QApplication(sys.argv)
tela_cadastro = uic.loadUi('tela_cadastro.ui')
tela_inserir_cliente = uic.loadUi('inserir_dados.ui')
tela_atualizar = uic.loadUi('atualizar_dados.ui')
tela_excluir = uic.loadUi('tela_excluir.ui')
 
 
# Conectando os botoes da janela principal as funções da janela principal
tela_cadastro.botao_inserir.clicked.connect(abrir_janela_inserir)
tela_cadastro.botao_pesquisar.clicked.connect(pesquisar)
tela_cadastro.botao_alterar.clicked.connect(abrir_janela_atualizar)
tela_cadastro.botao_sair.clicked.connect(sair)
tela_cadastro.botao_excluir.clicked.connect(abrir_janela_excluir)
 
 
# Conectando os botões da janela de inserir as funções da janela de inserir
tela_inserir_cliente.botao_inserir.clicked.connect(inserir_dados)
tela_inserir_cliente.botao_voltar.clicked.connect(fechar_janela_inserir)
 
# Conectando os botões da jenala atualizar as funções da janela atualizar
tela_atualizar.botao_voltar.clicked.connect(fechar_janela_atualizar)
tela_atualizar.botao_atualizar.clicked.connect(atualizar_dados)
 
 
# Conectando os botões da janela excluir as funções da janela excluir
tela_excluir.botao_voltar.clicked.connect(fechar_janela_excluir)
tela_excluir.botao_excluir.clicked.connect(excluir_dados)
 
 
atualiza_tabela_principal()
 
 
conexao().close()  # Fecha conexao no final do código