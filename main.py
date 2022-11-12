# Software de código abierto sin uso comercial alguno
# Creado por Desarrollo Front-Line
# David Castagneto Aguirre, Jose Antonio Gomez Lozano
# Diseñado para fines internos de Securitas Direct S.A.
# Pozuelo de Alarcon - Madrid - España - 2021
# This Python file uses the following encoding: utf-8

import sys
import os

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.load(os.path.join(os.path.dirname(__file__), "qml/loginPage.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
