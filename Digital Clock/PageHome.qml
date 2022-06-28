import QtQuick

Window {
    id: root
    width: 480
    height: 800
    visible: true
    title: qsTr("Dial Clock")
    Button {
        id: tim
        testo: "TIMER"
        state: "active"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 628
        anchors.leftMargin: 18
    }
    Button {
        id: alarm
        testo: "ALARM"
        state: "active"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 628
        anchors.rightMargin: 18
    }
    AlarmSwitch {
        id: as1
        anchors.centerIn: parent
    }
}
