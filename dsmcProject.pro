#-------------------------------------------------
#
# Project created by QtCreator 2020-09-16T15:21:52
#
#-------------------------------------------------

QT       -= core gui

TARGET = DSMC
TEMPLATE = lib

DEFINES += DSMCPROJECT_LIBRARY

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    parcels/derived/dsmcParcel/dsmcParcel.C \
    clouds/Templates/DSMCCloud/DSMCCloudName.C \
    parcels/derived/dsmcParcel/defineDSMCParcel.C \
    parcels/derived/dsmcParcel/makeDSMCParcelBinaryCollisionModels.C \
    parcels/derived/dsmcParcel/makeDSMCParcelWallInteractionModels.C \
    parcels/derived/dsmcParcel/makeDSMCParcelInflowBoundaryModels.C

HEADERS += \
    inputstream.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}

DEFINES += \
    linux64 \
    WM_ARCH_OPTION=64 \
    WM_DP \
    WM_LABEL_SIZE=32 \
    NoRepository \

INCLUDEPATH += \
    . \
    /opt/openfoam-dev/src/finiteVolume/lnInclude \
    /opt/openfoam-dev/src/lagrangian/basic/lnInclude \
    /opt/openfoam-dev/src/meshTools/lnInclude \
    lnInclude \
    /opt/openfoam-dev/src/OpenFOAM/lnInclude \
    /opt/openfoam-dev/src/OSspecific/POSIX/lnInclude

QMAKE_CXXFLAGS += \
    -std=c++14 \
    -m64 \
    -Wall -Wextra -Wold-style-cast -Wnon-virtual-dtor -Wno-unused-parameter \
    -Wno-invalid-offsetof -Wno-attributes -O3  -ftemplate-depth-100 \
    -fPIC -c

QMAKE_LIBDIR += /opt/openfoam-dev/platforms/linux64GccDPInt32Opt/lib

LIBS += -llagrangian -lfiniteVolume -lmeshTools

#g++ -std=c++14 -m64 -Dlinux64 -DWM_ARCH_OPTION=64 -DWM_DP -DWM_LABEL_SIZE=32 -Wall -Wextra -Wold-style-cast -Wnon-virtual-dtor -Wno-unused-parameter -Wno-invalid-offsetof -Wno-attributes -O3  -DNoRepository -ftemplate-depth-100 -I/opt/openfoam-dev/src/finiteVolume/lnInclude -I/opt/openfoam-dev/src/lagrangian/basic/lnInclude -I/opt/openfoam-dev/src/meshTools/lnInclude -IlnInclude -I. -I/opt/openfoam-dev/src/OpenFOAM/lnInclude -I/opt/openfoam-dev/src/OSspecific/POSIX/lnInclude   -fPIC -c parcels/derived/dsmcParcel/dsmcParcel.C -o Make/linux64GccDPInt32Opt/parcels/derived/dsmcParcel/dsmcParcel.o
#g++ -std=c++14 -m64 -Dlinux64 -DWM_ARCH_OPTION=64 -DWM_DP -DWM_LABEL_SIZE=32 -Wall -Wextra -Wold-style-cast -Wnon-virtual-dtor -Wno-unused-parameter -Wno-invalid-offsetof -Wno-attributes -O3  -DNoRepository -ftemplate-depth-100 -I/opt/openfoam-dev/src/finiteVolume/lnInclude -I/opt/openfoam-dev/src/lagrangian/basic/lnInclude -I/opt/openfoam-dev/src/meshTools/lnInclude -IlnInclude -I. -I/opt/openfoam-dev/src/OpenFOAM/lnInclude -I/opt/openfoam-dev/src/OSspecific/POSIX/lnInclude   -fPIC -c clouds/Templates/DSMCCloud/DSMCCloudName.C -o Make/linux64GccDPInt32Opt/clouds/Templates/DSMCCloud/DSMCCloudName.o
#g++ -std=c++14 -m64 -Dlinux64 -DWM_ARCH_OPTION=64 -DWM_DP -DWM_LABEL_SIZE=32 -Wall -Wextra -Wold-style-cast -Wnon-virtual-dtor -Wno-unused-parameter -Wno-invalid-offsetof -Wno-attributes -O3  -DNoRepository -ftemplate-depth-100 -I/opt/openfoam-dev/src/finiteVolume/lnInclude -I/opt/openfoam-dev/src/lagrangian/basic/lnInclude -I/opt/openfoam-dev/src/meshTools/lnInclude -IlnInclude -I. -I/opt/openfoam-dev/src/OpenFOAM/lnInclude -I/opt/openfoam-dev/src/OSspecific/POSIX/lnInclude   -fPIC -c parcels/derived/dsmcParcel/defineDSMCParcel.C -o Make/linux64GccDPInt32Opt/parcels/derived/dsmcParcel/defineDSMCParcel.o
#g++ -std=c++14 -m64 -Dlinux64 -DWM_ARCH_OPTION=64 -DWM_DP -DWM_LABEL_SIZE=32 -Wall -Wextra -Wold-style-cast -Wnon-virtual-dtor -Wno-unused-parameter -Wno-invalid-offsetof -Wno-attributes -O3  -DNoRepository -ftemplate-depth-100 -I/opt/openfoam-dev/src/finiteVolume/lnInclude -I/opt/openfoam-dev/src/lagrangian/basic/lnInclude -I/opt/openfoam-dev/src/meshTools/lnInclude -IlnInclude -I. -I/opt/openfoam-dev/src/OpenFOAM/lnInclude -I/opt/openfoam-dev/src/OSspecific/POSIX/lnInclude   -fPIC -c parcels/derived/dsmcParcel/makeDSMCParcelBinaryCollisionModels.C -o Make/linux64GccDPInt32Opt/parcels/derived/dsmcParcel/makeDSMCParcelBinaryCollisionModels.o
#g++ -std=c++14 -m64 -Dlinux64 -DWM_ARCH_OPTION=64 -DWM_DP -DWM_LABEL_SIZE=32 -Wall -Wextra -Wold-style-cast -Wnon-virtual-dtor -Wno-unused-parameter -Wno-invalid-offsetof -Wno-attributes -O3  -DNoRepository -ftemplate-depth-100 -I/opt/openfoam-dev/src/finiteVolume/lnInclude -I/opt/openfoam-dev/src/lagrangian/basic/lnInclude -I/opt/openfoam-dev/src/meshTools/lnInclude -IlnInclude -I. -I/opt/openfoam-dev/src/OpenFOAM/lnInclude -I/opt/openfoam-dev/src/OSspecific/POSIX/lnInclude   -fPIC -c parcels/derived/dsmcParcel/makeDSMCParcelWallInteractionModels.C -o Make/linux64GccDPInt32Opt/parcels/derived/dsmcParcel/makeDSMCParcelWallInteractionModels.o
#g++ -std=c++14 -m64 -Dlinux64 -DWM_ARCH_OPTION=64 -DWM_DP -DWM_LABEL_SIZE=32 -Wall -Wextra -Wold-style-cast -Wnon-virtual-dtor -Wno-unused-parameter -Wno-invalid-offsetof -Wno-attributes -O3  -DNoRepository -ftemplate-depth-100 -I/opt/openfoam-dev/src/finiteVolume/lnInclude -I/opt/openfoam-dev/src/lagrangian/basic/lnInclude -I/opt/openfoam-dev/src/meshTools/lnInclude -IlnInclude -I. -I/opt/openfoam-dev/src/OpenFOAM/lnInclude -I/opt/openfoam-dev/src/OSspecific/POSIX/lnInclude   -fPIC -c parcels/derived/dsmcParcel/makeDSMCParcelInflowBoundaryModels.C -o Make/linux64GccDPInt32Opt/parcels/derived/dsmcParcel/makeDSMCParcelInflowBoundaryModels.o
#g++ -std=c++14 -m64 -Dlinux64 -DWM_ARCH_OPTION=64 -DWM_DP -DWM_LABEL_SIZE=32 -Wall -Wextra -Wold-style-cast -Wnon-virtual-dtor -Wno-unused-parameter -Wno-invalid-offsetof -Wno-attributes -O3  -DNoRepository -ftemplate-depth-100 -I/opt/openfoam-dev/src/finiteVolume/lnInclude -I/opt/openfoam-dev/src/lagrangian/basic/lnInclude -I/opt/openfoam-dev/src/meshTools/lnInclude -IlnInclude -I. -I/opt/openfoam-dev/src/OpenFOAM/lnInclude -I/opt/openfoam-dev/src/OSspecific/POSIX/lnInclude   -fPIC -fuse-ld=bfd -shared -Xlinker --add-needed -Xlinker --no-as-needed Make/linux64GccDPInt32Opt/parcels/derived/dsmcParcel/dsmcParcel.o Make/linux64GccDPInt32Opt/clouds/Templates/DSMCCloud/DSMCCloudName.o Make/linux64GccDPInt32Opt/parcels/derived/dsmcParcel/defineDSMCParcel.o Make/linux64GccDPInt32Opt/parcels/derived/dsmcParcel/makeDSMCParcelBinaryCollisionModels.o Make/linux64GccDPInt32Opt/parcels/derived/dsmcParcel/makeDSMCParcelWallInteractionModels.o Make/linux64GccDPInt32Opt/parcels/derived/dsmcParcel/makeDSMCParcelInflowBoundaryModels.o -L/opt/openfoam-dev/platforms/linux64GccDPInt32Opt/lib \
#    -llagrangian -lfiniteVolume -lmeshTools  -o /home/alex/OpenFOAM/alex-dev/platforms/linux64GccDPInt32Opt/lib/libDSMC.so
