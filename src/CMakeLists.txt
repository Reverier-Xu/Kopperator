add_library(kopperatorplugin SHARED
    chatbackend.cpp
    plugin.cpp
)

target_link_libraries(kopperatorplugin
    PRIVATE
        Qt6::Qml
        Qt6::Quick
)

set_target_properties(kopperatorplugin PROPERTIES
    VERSION ${PROJECT_VERSION}
    SOVERSION ${PROJECT_VERSION_MAJOR}
)

install(TARGETS kopperatorplugin
    DESTINATION ${KDE_INSTALL_QMLDIR}/org/reverier/kopperator
)

install(FILES qmldir
    DESTINATION ${KDE_INSTALL_QMLDIR}/org/reverier/kopperator
)
