import QtQuick

Rectangle{
    id: root
    property string testo: ""
    width: 190
    height: 280
    color: "#1B2F46"
    radius: 30

    Text {
        id: conta
        text: qsTr("00")
        color: "#FCB647"
        font.pixelSize: 120
        anchors.centerIn: parent
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -25
    }

    Text {
        id: txt
        text: testo
        color: "#9FAAB0"
        font.pixelSize: 20
        anchors.centerIn: parent
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 85
    }
}
