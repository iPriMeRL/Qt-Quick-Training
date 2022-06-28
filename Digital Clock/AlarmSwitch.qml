import QtQuick

Rectangle {
    id: root
    property bool isOn: false
    width: 112
    height: 60
    radius: 8
    color: "#313848"

    Image {
        id: navicella
        source: root.isOn ? "/assets/switch-on-selected.svg" : "/assets/switch-on-disable2.svg"
        anchors.right: parent.right
        anchors.rightMargin: 4
        anchors.top: parent.top
        anchors.topMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
    }
    Image {
        id: tasto
        source: root.isOn ? "/assets/switch-off-disable.svg" : "/assets/switch-off-selected.svg"
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
            if(root.isOn){
                root.isOn = false
                root.color = "#313848"
            }
            else{
                root.isOn = true
                root.color = "#0f494f"
            }
        }
    }
}
