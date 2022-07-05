import QtQuick

Rectangle{
    id: root
    property bool isEveryday: true
    property bool isSetDate: true
    width: 480
    height: 800
    color: "#151B2E"

    Image {
        id: goBack
        source: "/assets/btn-back-hover.svg"
        anchors.left: root.left
        anchors.top: root.top
        anchors.leftMargin: 28
        anchors.topMargin: 20

        MouseArea{
            anchors.fill: parent
            onClicked: stackView.pop()
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

    Button192x50 {
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
    Button192x50 {
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

    Button434x64 {
        id: setAlarm
        testo: "SET ALARM"
        colTesto: "#00A6E2"
        border.color: "#00A6E2"
        state: "active"
        anchors.top: root.top
        anchors.topMargin: 706
        anchors.left: root.left
        anchors.leftMargin: 23

        MouseArea{
            anchors.fill: parent
            onClicked: stackView.pop()
        }
    }
}
