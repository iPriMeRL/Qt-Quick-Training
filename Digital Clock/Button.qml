import QtQuick

Rectangle {
    id: root
    property string testo: ""
    property string colTesto: ""
    width: 190
    height: 64
    radius: 32
    border.color: "#FCB647"
    border.width: 1
    states: [
        State {
            name: "active"
            PropertyChanges {
                target: root
                opacity: 1
                colTesto: "#FCB647"
            }
        },
        State {
            name: "hover"
            PropertyChanges {
                target: root
                opacity: 1
                color: "#FCB647"
                colTesto: "black"
            }
        }
    ]

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

    MouseArea{
        anchors.fill: root
        onClicked: root.state === "active" ? root.state = "hover" : root.state = "active"
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 1000
        }
    }
}
