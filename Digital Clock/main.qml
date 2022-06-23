import QtQuick

Window {
    id: root
    width: 480
    height: 800
    visible: true
    title: qsTr("Dial Clock")
    Button {
        id: ciao
        testo: "AOH"
        state: "active"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 628
        anchors.leftMargin: 18
    }
    Button {
        id: arrivederci
        testo: "BELLA"
        state: "active"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 628
        anchors.rightMargin: 18
    }
}
