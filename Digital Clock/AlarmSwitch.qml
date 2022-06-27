import QtQuick

Rectangle {
    id: root
    property bool onOrOff: false
    width: 112
    height: 60
    radius: 8
    color: "#313848"

    Image {
        id: navicella
        source: {
            if(root.onOrOff) return "/assets/switch-on-selected.svg"
            else return "/assets/switch-on-disable.svg"
        }
        anchors.right: parent.right
        anchors.rightMargin: 4
        anchors.top: parent.top
        anchors.topMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
    }
    Image {
        id: tasto
        source: {
            if(root.onOrOff) return "/assets/switch-off-disable.svg"
            else return "/assets/switch-off-selected.svg"
        }
        anchors.left: parent.left
        anchors.leftMargin: 4
        anchors.top: parent.top
        anchors.topMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
    }

    MouseArea {
        anchors.fill: root
        onClicked: {
            if(root.onOrOff){
                root.onOrOff = false
                root.color = "#313848"
            }
            else{
                root.onOrOff = true
                root.color = "#0f494f"
            }
        }
    }
}
