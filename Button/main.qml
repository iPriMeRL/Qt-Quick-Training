import QtQuick

Window {
    id: root
    width: 1000
    height: 1000
    visible: true
    title: qsTr("Button")

    SwitchButton {id: sb}

    MouseArea {
        id: sx
        width: 200
        height: 400
        anchors.left: sb.left
        anchors.verticalCenter: sb.verticalCenter
        onClicked: sb.state = "clickSx"

    }

    MouseArea {
        id: dx
        width: 200
        height: 400
        anchors.right: sb.right
        anchors.verticalCenter: sb.verticalCenter
        onClicked: sb.state = "clickDx"
    }

    Item {
        id: itemSx
        width: 200
        height: 400
        anchors.left: sb.left
        anchors.verticalCenter: sb.verticalCenter
        Text {
            id: sinistra
            text: qsTr("to Red")
            anchors.centerIn: parent
            color: "white"
        }
    }

    Item {
        id: itemDx
        width: 200
        height: 400
        anchors.right: sb.right
        anchors.verticalCenter: sb.verticalCenter
        Text {
            id: destra
            text: qsTr("to Blue")
            anchors.centerIn: parent
            color: "white"
        }
    }

}
