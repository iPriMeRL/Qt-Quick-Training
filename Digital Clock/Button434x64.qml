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
    states: [
        State {
            name: "active"
            PropertyChanges {
                target: root
                color: "#151B2E"
            }
            PropertyChanges {
                target: txt
                color: colTesto
            }
        },
        State {
            name: "hover"
            PropertyChanges {
                target: root
                color: colTesto
            }
            PropertyChanges {
                target: txt
                color: "white"
            }
        }
    ]

    Text {
        id: txt
        text: root.testo
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
