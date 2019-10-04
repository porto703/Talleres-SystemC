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

systemc_ams_home = $$(SYSTEMCAMS_HOME)
isEmpty(systemc_ams_home) {
    systemc_ams_home = /opt/systemc-ams
}

systemc_ams_target_arch = $$(SYSTEMCAMS_TARGET_ARCH)
isEmpty(systemc_ams_target_arch) {
    systemc_ams_target_arch = linux64
}

unix:!macx {
    QMAKE_CXXFLAGS += -std=c++11 -O0 -g
    QMAKE_RPATHDIR += $${systemc_home}/lib-$${systemc_target_arch}
    QMAKE_RPATHDIR += $${systemc_ams_home}/lib-$${systemc_ams_target_arch}
    QMAKE_CXXFLAGS += -isystem $${systemc_home}/include
    QMAKE_CXXFLAGS += -isystem $${systemc_ams_home}/include
}

macx: {
    systemc_target_arch = macosx64
    systemc_ams_target_arch = macosx64
    QMAKE_CXXFLAGS += -std=c++0x -stdlib=libc++ -O0 -g
}

INCLUDEPATH += $${systemc_home}/include
INCLUDEPATH += $${systemc_ams_home}/include
LIBS += -L$${systemc_home}/lib-$${systemc_target_arch} -lsystemc
LIBS += -L$${systemc_ams_home}/lib-$${systemc_ams_target_arch} -lsystemc-ams

SOURCES += \
        main.cpp
