import QtQuick

Rectangle{
    id: root
    property bool isEveryday: false
    property bool isSetDate: false
    width: 480
    height: 800
    color: "#151B2E"
    signal toBack;

    Image {
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

    Text {
        id: alClockList
        text: qsTr("Alarm")
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

    ButtonEveryAndDate {
        id: everyday
        testo: "Everyday"
        state: root.isEveryday ? "active" : "hover"
        anchors.top: root.top
        anchors.topMargin: 140
        anchors.left: root.left
        anchors.leftMargin: 34

        MouseArea{
            anchors.fill: parent
            onClicked: {
                root.isEveryday = !root.isEveryday
                if(root.isSetDate) root.isSetDate = false
            }
        }
    }
    ButtonEveryAndDate {
        id: date
        testo: "Set date"
        state: root.isSetDate ? "active" : "hover"
        anchors.top: root.top
        anchors.topMargin: 140
        anchors.left: root.left
        anchors.leftMargin: 254

        MouseArea{
            anchors.fill: parent
            onClicked: {
                root.isSetDate = !root.isSetDate
                if(root.isEveryday) root.isEveryday = false
            }
        }
    }

    Button {
        id: setAlarm
        width: 434
        height: 64
        state: "active"
        testo: "SET ALARM"
        colTestoAct: "#00A6E2"
        colBotAct: "#151B2E"
        colTestoHov: "white"
        colBotHov: "#00A6E2"
        anchors.top: root.top
        anchors.topMargin: 706
        anchors.left: root.left
        anchors.leftMargin: 23

        MouseArea{
            anchors.fill: parent
            onClicked: root.toBack()
        }
    }
}
