ADS_OUT_ROOT = $${OUT_PWD}/..

include($$(cetoni_repository)/build/qt/qtprojectsettings/common.pri)

TARGET = AdvancedDockingSystemDemo
DESTDIR = $${ADS_OUT_ROOT}/lib
QT += core gui widgets quick quickwidgets opengl

include(../ads.pri)

lessThan(QT_MAJOR_VERSION, 6) {
    win32 {
        QT += axcontainer
    }
} else {
	QT +=  openglwidgets
}

CONFIG += c++14
CONFIG += debug_and_release
DEFINES += QT_DEPRECATED_WARNINGS
RC_FILE += app.rc

adsBuildStatic {
    DEFINES += ADS_STATIC
}


HEADERS += \
	MainWindow.h \
	StatusDialog.h \
	ImageViewer.h \
	RenderWidget.h \ 
	glwidget.h \
	logo.h
	

SOURCES += \
	main.cpp \
	MainWindow.cpp \
	StatusDialog.cpp \
	ImageViewer.cpp \
	RenderWidget.cpp \
	glwidget.cpp \
	logo.cpp

FORMS += \
	mainwindow.ui \
	StatusDialog.ui
	
RESOURCES += demo.qrc


LIBS += -L$${ADS_OUT_ROOT}/lib


INCLUDEPATH += ../src
DEPENDPATH += ../src


DEFINES += COIN_NOT_DLL \
        SOQT_NOT_DLL \
        QUARTER_NOT_DLL
        
LIBS *= -lopengl32

CONFIG(debug, debug|release){
        LIBS *= -llibSoQtd \
                -llibCoin-80d \
                -llibrlmdld \
                -llibrlsgd \
                -llibsolid3_d \
                -lquarterd
}else{
        LIBS *= -llibSoQt \
                -llibCoin-80 \
                -llibrlmdl \
                -llibrlsg \
                -llibsolid3 \
                -lquarter
}
