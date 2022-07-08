import QtQuick

Rectangle{
    id: root
    width: 480
    height: 800
    color: "#151B2E"
    signal toBack;

    Image{
        id: goBack
        source: "/assets/btn-back-active.svg"
        anchors.left: root.left
        anchors.top: root.top
        anchors.leftMargin: 28
        anchors.topMargin: 20

        MouseArea{
            anchors.fill: parent
            onClicked: root.toBack()
        }
    }

    Button {
        id: stTim
        width: 434
        height: 64
        testo: "START"
        colTestoAct: "#00A6E2"
        colBotAct: "#151B2E"
        state: "active"
        anchors.top: root.top
        anchors.topMargin: 706
        anchors.left: root.left
        anchors.leftMargin: 23

        MouseArea{
            anchors.fill: parent
            onClicked: root.toBack()
        }
    }

    Text {
        id: timer
        text: qsTr("Timer")
        color: "#9FAAB0"
        font.pixelSize: 30
        anchors.horizontalCenter: root.horizontalCenter
        anchors.top: root.top
        anchors.topMargin: 40
    }

    Rectangle{
        width: 424
        height: 1
        color: "#9FAAB0"
        anchors.horizontalCenter: root.horizontalCenter
        anchors.top: root.top
        anchors.topMargin: 120
    }

    PageTimerBlock {
        id: hours
        testo: "hours"
        anchors.left: parent.left
        anchors.leftMargin: 28
        anchors.top: parent.top
        anchors.topMargin: 160
    }

    PageTimerBlock {
        id: mins
        testo: "mins"
        anchors.right: parent.right
        anchors.rightMargin: 28
        anchors.top: parent.top
        anchors.topMargin: 160
    }

    PageTimerArrows{
        anchors.top: hours.bottom
        anchors.left: root.left
        anchors.leftMargin: 28
    }
    PageTimerArrows{
        anchors.top: mins.bottom
        anchors.right: root.right
        anchors.rightMargin: 28
    }

}
