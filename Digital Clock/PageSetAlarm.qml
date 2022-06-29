import QtQuick

Rectangle{
    id: root
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

    Button3{
        id: everyday
        testo: "Everyday"
        state: "hover"
        anchors.top: root.top
        anchors.topMargin: 140
        anchors.left: root.left
        anchors.leftMargin: 34

        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(parent.state === "hover"){
                    if(date.state === "active"){
                        date.state = "hover"
                        date.testo = "Set date"
                    }
                    parent.state = "active"
                }
                else{
                    parent.state = "hover"
                }
            }
        }
    }
    Button3{
        id: date
        testo: "Set date"
        state: "hover"
        anchors.top: root.top
        anchors.topMargin: 140
        anchors.left: root.left
        anchors.leftMargin: 254

        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(parent.state === "hover"){
                    if(everyday.state === "active") everyday.state = "hover"
                    parent.state = "active"
                }
                else{
                    parent.state = "hover"
                }
            }
        }
    }
}
