cmake_minimum_required(VERSION 3.16)

project(provaClock VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appprovaClock
    main.cpp
)

qt_add_qml_module(appprovaClock
    URI provaClock
    VERSION 1.0
    QML_FILES main.qml Button190x64.qml AlarmSwitch.qml PageHome.qml PageAlarmList.qml
    Button192x50.qml PageSetAlarm.qml PageAlarmListComponent.qml
    Button434x64.qml PageTimer.qml PageTimerBlock.qml PageTimerArrows.qml
)

qt_add_resources(appprovaClock
    "assets"
    PREFIX "/"
    FILES assets/switch-on-selected.svg assets/switch-off-disable.svg
    assets/switch-off-selected.svg assets/switch-on-disable2.svg
    assets/btn-back-hover.svg assets/check_disabled.svg assets/check_selected.svg
    assets/ic-tick-selected.svg assets/ic-tick-disabled.svg assets/btn-arrow-active.svg
    assets/timer.svg assets/alarm-on-feedback.svg
)

set_target_properties(appprovaClock PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(appprovaClock
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(appprovaClock
    PRIVATE Qt6::Quick)
