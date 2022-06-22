import QtQuick

Rectangle {
    id: bar
    height: 80
    width: 500
    color: "black"
    property real perc: 0

    Timer {
        id: timer
        interval: 500
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            perc = Math.random()
            text.text = (Math.round(parent.perc*100))+"%"
        }
    }

    Rectangle {
        id: barIn
        width: parent.width*parent.perc
        height: parent.height
        color: "green"

        Behavior on width {
            NumberAnimation {
                duration: 100
            }
        }
    }

    Text {
        id: text
        text: qsTr("0%")
        color: "white"
    }
}
