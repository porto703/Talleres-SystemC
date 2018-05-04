# Talleres-SystemC
Instalar SystemC en una distribución Linux (Ubuntu):
wget http://www.accellera.org/images/downloads/standards/systemc/systemc-2.3.1a.tar.gz
tar xfv systemc-2.3.1a.tar.gz
cd systemc-2.3.1a
./configure --prefix=/opt/systemc/
make -j4
sudo make install

**********************************************
QT Creator:
Versión Open Source disponible en https://www.qt.io/download-qt-for-application-development
Algunas distribuciones Linux proveen un paquete de instalación. (Ubuntu)
$ sudo apt-get install qtcreator 

Abrir QTCreator.
New Project
Non-Qt Project -> Plain C++ Application
Abrir: [project_name].pro
Al crear nuevo proyecto Reemplazar (Todo exepto SOURCES += main.cpp):

TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

systemc_home = $$(SYSTEMC_HOME)
isEmpty(systemc_home) {
    systemc_home = /opt/systemc
}

systemc_target_arch = $$(SYSTEMC_TARGET_ARCH)
isEmpty(systemc_target_arch) {
    systemc_target_arch = linux64
}

unix:!macx {
    QMAKE_CXXFLAGS += -std=c++11 -O0 -g
    QMAKE_RPATHDIR += $${systemc_home}/lib-$${systemc_target_arch}
    QMAKE_CXXFLAGS += -isystem $${systemc_home}/include
}

macx: {
    systemc_target_arch = macosx64
    QMAKE_CXXFLAGS += -std=c++0x -stdlib=libc++ -O0 -g
}

INCLUDEPATH += $${systemc_home}/include
LIBS += -L$${systemc_home}/lib-$${systemc_target_arch} -lsystemc

***************************************
en main.cpp escribir primer programa de prueba, para mostrar en consola un mensaje de éxito:

#include <systemc>

using namespace sc_core;

int sc_main(int argc, char* argv[])
{
  sc_start(10, SC_SEC);
  std::cout<<"Instalacion de SystemC correcta"<<std::endl;
  return 0;
}
