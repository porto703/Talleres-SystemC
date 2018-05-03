# Talleres-SystemC
Instalar en una distribución Linux (Ubuntu):
wget http://www.accellera.org/images/downloads/standards/systemc/systemc-2.3.1a.tar.gz
tar xfv systemc-2.3.1a.tar.gz
cd systemc-2.3.1a
./configure --prefix=/opt/systemc/
make -j4
sudo make install

Al crear nuevo proyecto Reemplazar:

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

