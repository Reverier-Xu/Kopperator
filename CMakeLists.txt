cmake_minimum_required(VERSION 3.16)

project(Kopperator VERSION 0.1 LANGUAGES CXX)

find_package(ECM 5.240.0 REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH})

include(KDEInstallDirs)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(KDECMakeSettings)

find_package(Qt6 6.6 REQUIRED COMPONENTS Qml Quick)

add_subdirectory(src)

install(DIRECTORY package/
    DESTINATION ${KDE_INSTALL_PLASMAPACKAGE_DIR}/org.reverier.kopperator
)
