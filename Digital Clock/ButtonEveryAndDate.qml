import QtQuick

Rectangle {
    id: root
    property string testo: ""
    width: 192
    height: 50
    radius: 25
    color: "#313848"
    states: [
        State {
            name: "active"
            PropertyChanges {
                target: root
                border.color: "#E2E5E7"
                border.width: 1
            }
        },
        State {
            name: "hover"
            PropertyChanges {
                target: root
                border.width: 0
            }
        }
    ]

    Text {
        id: txt
        text: root.testo
        color: "#E2E5E7"
        font.family: "Ubuntu Light"
        font.pixelSize: 20
        anchors.top: root.top
        anchors.topMargin: 13
        anchors.left: root.left
        anchors.leftMargin: 70
    }

    Image {
        id: tick
        source: root.state === "active" ? "/assets/ic-tick-selected.svg" : "/assets/ic-tick-disabled.svg"
        anchors.left: root.left
        anchors.leftMargin: 21
        anchors.top: root.top
        anchors.topMargin: 8
    }

}
