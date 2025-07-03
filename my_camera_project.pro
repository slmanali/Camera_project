QT += core gui widgets concurrent multimedia
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17
CONFIG += debug

TARGET = my_camera_project

SOURCES += main.cpp \
           camera_viewer.cpp 

HEADERS += camera_viewer.h\
            Configuration.h \
            Logger.h \
            gpio.h \
            Audio.h \
            HTTPSession.h \
            power_management.h \ 
            speechThread.h \
            camerareader.h \ 
            PDFCreator.h \
            videocontroller.h\
            LanguageManager.h \
            FloatingMessage.h \
            imu_classifier_thread.h
            
# Include OpenCV and GStreamer
INCLUDEPATH += /usr/include/opencv4
INCLUDEPATH += /usr/include/gstreamer-1.0
INCLUDEPATH += /usr/lib/aarch64-linux-gnu/gstreamer-1.0
INCLUDEPATH += /usr/include/jsoncpp
INCLUDEPATH += /usr/include/poppler/qt5
INCLUDEPATH += /usr/include/boost
INCLUDEPATH += /home/x_user/my_camera_project/onnxruntime/include

#INCLUDEPATH += /usr/include/Qt5GStreamer/QGst
#INCLUDEPATH += /usr/include/Qt5GStreamer/QGlib


# Include GLib-2.0 (required for GStreamer)
INCLUDEPATH += /usr/include/glib-2.0
INCLUDEPATH += /usr/lib/aarch64-linux-gnu/glib-2.0/include

# Add pkg-config flags for GStreamer and GLib
LIBS += `pkg-config --cflags --libs gstreamer-1.0 gstreamer-app-1.0 glib-2.0` \
        -lopencv_core -lopencv_imgproc -lopencv_videoio -lopencv_imgcodecs -lcurl -ljsoncpp -lgpiod -lpoppler-qt5 -lssl -lcrypto -lzbar -lX11 \
        -lzip -lpthread -L/home/x_user/my_camera_project -lvosk -lgstreamer-1.0 -lgstapp-1.0 -lgstvideo-1.0 -lhpdf -lpng -lz -lQt5GLib-2.0 -lonnxruntime
        #-lQt5GStreamer-1.0 -lQt5GStreamerUtils-1.0 -lQt5GStreamerUi-1.0 

PKGCONFIG += gstreamer-1.0 gstreamer-app-1.0 gstreamer-video-1.0
# Ensure GStreamer plugins are found
QMAKE_LFLAGS += -Wl,-rpath=/usr/lib/aarch64-linux-gnu/gstreamer-1.0
QMAKE_CXXFLAGS += -Wall -Wextra -Wno-deprecated-declarations -Wno-psabi -fsanitize=address -g
QMAKE_LFLAGS += -fsanitize=address
#QMAKE_CXXFLAGS += -pg
#QMAKE_LFLAGS += -pg

#QMAKE_CXXFLAGS_RELEASE += -O2
#QMAKE_CXXFLAGS += -Wno-unknown-pragmas
#camera_viewer.cpp {
#    QMAKE_CXXFLAGS += -O0
#}