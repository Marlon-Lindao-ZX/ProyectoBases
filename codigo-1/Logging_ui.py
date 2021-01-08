# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'Loggin_ui.ui'
#
# Created by: PyQt5 UI code generator 5.11.3
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Logging_ui(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(291, 243)
        MainWindow.setMinimumSize(QtCore.QSize(280, 237))
        MainWindow.setStyleSheet("border-color: qlineargradient(spread:pad, x1:0, y1:1, x2:0, y2:0, stop:0 rgba(0, 0, 0, 255), stop:0.05 rgba(14, 8, 73, 255), stop:0.36 rgba(28, 17, 145, 255), stop:0.6 rgba(126, 14, 81, 255), stop:0.75 rgba(234, 11, 11, 255), stop:0.79 rgba(244, 70, 5, 255), stop:0.86 rgba(255, 136, 0, 255), stop:0.935 rgba(239, 236, 55, 255));")
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.verticalLayout = QtWidgets.QVBoxLayout(self.centralwidget)
        self.verticalLayout.setObjectName("verticalLayout")
        self.formLayout = QtWidgets.QFormLayout()
        self.formLayout.setObjectName("formLayout")
        self.label = QtWidgets.QLabel(self.centralwidget)
        self.label.setObjectName("label")
        self.formLayout.setWidget(0, QtWidgets.QFormLayout.LabelRole, self.label)
        self.label_2 = QtWidgets.QLabel(self.centralwidget)
        self.label_2.setObjectName("label_2")
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.LabelRole, self.label_2)
        self.txt_usu = QtWidgets.QLineEdit(self.centralwidget)
        self.txt_usu.setAutoFillBackground(False)
        self.txt_usu.setObjectName("txt_usu")
        self.formLayout.setWidget(0, QtWidgets.QFormLayout.FieldRole, self.txt_usu)
        self.txt_con = QtWidgets.QLineEdit(self.centralwidget)
        self.txt_con.setObjectName("txt_con")
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.FieldRole, self.txt_con)
        self.verticalLayout.addLayout(self.formLayout)
        self.horizontalLayout = QtWidgets.QHBoxLayout()
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.btn_Ing = QtWidgets.QPushButton(self.centralwidget)
        self.btn_Ing.setObjectName("btn_Ing")
        self.horizontalLayout.addWidget(self.btn_Ing)
        self.btn_lim = QtWidgets.QPushButton(self.centralwidget)
        self.btn_lim.setObjectName("btn_lim")
        self.horizontalLayout.addWidget(self.btn_lim)
        self.verticalLayout.addLayout(self.horizontalLayout)
        MainWindow.setCentralWidget(self.centralwidget)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow"))
        self.label.setText(_translate("MainWindow", "Usuario"))
        self.label_2.setText(_translate("MainWindow", "Contrasena"))
        self.txt_usu.setPlaceholderText(_translate("MainWindow", "Ingrese su Usuario"))
        self.txt_con.setPlaceholderText(_translate("MainWindow", "Ingrese su Contrasena"))
        self.btn_Ing.setText(_translate("MainWindow", "Ingresar"))
        self.btn_lim.setText(_translate("MainWindow", "Limpiar"))

