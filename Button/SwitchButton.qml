import QtQuick

Rectangle {
    id: switchButton
    width: 400
    height: 400
    anchors.centerIn: parent
    color: "black"
    states: [
        State {
            name: "clickSx"
            PropertyChanges {
                target: switchButton
                color: "red"
            }
        },
        State {
            name: "clickDx"
            PropertyChanges {
                target: switchButton
                color: "blue"
            }
        }
    ]

    Rectangle {
        id: lineaCentrale
        width: 5
        height: 400
        color: "black"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    MouseArea {
        id: sx
        width: 200
        height: 400
        anchors.left: switchButton.left
        anchors.verticalCenter: switchButton.verticalCenter
        onClicked: switchButton.state = "clickSx"

    }

    MouseArea {
        id: dx
        width: 200
        height: 400
        anchors.right: switchButton.right
        anchors.verticalCenter: switchButton.verticalCenter
        onClicked: switchButton.state = "clickDx"
    }
}
