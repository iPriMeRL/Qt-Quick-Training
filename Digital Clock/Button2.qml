import QtQuick

Rectangle {
    id: root
    width: 434
    height: 64
    radius: 32
    border.color: "#EC6545"
    border.width: 1
    property string testo: ""
    property string colTesto: "#EC6545"

    Text {
        id: txt
        text: root.testo
        color: root.colTesto
        font.family: "Ubuntu Light"
        anchors.centerIn: root
        font.letterSpacing: 1.8
        anchors.topMargin: 14
        anchors.bottomMargin: 14
        font.pixelSize: 30
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 300
        }
    }
}
