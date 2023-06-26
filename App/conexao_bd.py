import pyodbc


# Configuração da conexão
server = 'server'
database = 'database-name'
username = 'username'
password = 'password'
driver = '{ODBC Driver 18 for SQL Server}'  # Pode variar dependendo do driver instalado

# String de conexão
connection_string = f"DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password}"

# Conexão
connection = pyodbc.connect(connection_string)


def listarItens(consulta):  # Função para consultas (select)
    array = []  # Armazena a saída da consulta
    
    query = consulta

    cursor = connection.cursor()
    cursor.execute(query)

    # Processar resultados
    for row in cursor:
        array.append(row)
    #    print(row)

    return array


def alterarDeletar(consulta):  # Função que pode ser utilizada tanto para alterar quanto para deletar
    array = []

    query = consulta

    cursor = connection.cursor()
    cursor.execute(query)
    connection.commit()

    return array


# Fechar conexão
connection.close()