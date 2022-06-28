import QtQuick

Rectangle {
    id: root
    property string testo: ""
    property string colTesto: "#EC6545"
    width: 434
    height: 64
    radius: 32
    border.color: "#EC6545"
    border.width: 1

    Text {
        id: txt
        text: root.testo
        color: root.colTesto
        font.family: "Ubuntu Light"
        font.letterSpacing: 1.8
        font.pixelSize: 30
        anchors.centerIn: root
        anchors.topMargin: 14
        anchors.bottomMargin: 14
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 300
        }
    }
}
