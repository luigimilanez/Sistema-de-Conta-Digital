import main
import sys
from PyQt5 import uic, QtWidgets



def sair_app_cliente():
    main.tela_cadastro.close()



main.tela_cadastro.show()

main.tela_cadastro.botao_sair.clicked.connect(sair_app_cliente)

main.app.exec()

