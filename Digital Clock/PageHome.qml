import QtQuick

Rectangle {
    id: root
    property bool isTimerActive: false
    property bool isAlarmActive: false
    property bool isAm: false
    width: 480
    height: 800
    color: "#151B2E"

    Text {
        id: deveClock
        text: qsTr("DeveClock")
        color: "#9FAAB0"
        font.pixelSize: 30
        anchors.horizontalCenter: root.horizontalCenter
        anchors.top: root.top
        anchors.topMargin: 40
    }

    Image {
        id: t
        source: "/assets/timer.svg"
        opacity: isTimerActive ? 1 : 0
        anchors.top: root.top
        anchors.topMargin: 33
        anchors.right: root.right
        anchors.rightMargin: 81
    }
    Image {
        id: navicella
        source: "/assets/alarm-on-feedback.svg"
        opacity: isAlarmActive ? 1 : 0
        anchors.top: root.top
        anchors.topMargin: 33
        anchors.right: root.right
        anchors.rightMargin: 27
    }

    Rectangle{
        width: 424
        height: 1
        color: "#9FAAB0"
        anchors.horizontalCenter: root.horizontalCenter
        anchors.top: root.top
        anchors.topMargin: 120
    }

    Rectangle{
        width: 444
        height: 390
        color: "#1B2F46"
        radius: 40
        anchors.horizontalCenter: root.horizontalCenter
        anchors.top: root.top
        anchors.topMargin: 160

        Text {
            id: giorno
            text: qsTr("Martedì 4 Luglio")
            color: "#FCB647"
            font.pixelSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 40
        }
        Text {
            id: ora
            text: qsTr("9:00")
            color: "#FCB647"
            font.pixelSize: 120
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 137
        }
        Text {
            id: amOrPm
            text: isAm ? "AM" : "PM"
            color: "#9FAAB0"
            font.pixelSize: 30
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 292
        }
    }

    Button190x64 {
        id: tim
        testo: "TIMER"
        state: "active"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 628
        anchors.leftMargin: 18
        MouseArea{
            anchors.fill: parent
            onClicked: stackView.push(pageTimer)
        }
    }
    Button190x64 {
        id: alarm
        testo: "ALARM"
        state: "active"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 628
        anchors.rightMargin: 18
        MouseArea{
            anchors.fill: parent
            onClicked: stackView.push(pageAlarmList)
        }
    }
}
