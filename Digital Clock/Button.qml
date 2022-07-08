import QtQuick

Rectangle {
    id: root
    property string testo: ""
    property string colTestoAct: ""
    property string colTestoHov: ""
    property string colBotAct: ""
    property string colBotHov: ""
    width: 190
    height: 64
    radius: 32
    border.color: state === "active" ? colTestoAct : colBotHov
    border.width: 1
    states: [
        State {
            name: "active"
            PropertyChanges {
                target: root
                color: colBotAct
            }
            PropertyChanges {
                target: txt
                color: colTestoAct
            }
        },
        State {
            name: "hover"
            PropertyChanges {
                target: root
                color: colBotHov
            }
            PropertyChanges {
                target: txt
                color: colTestoHov
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
