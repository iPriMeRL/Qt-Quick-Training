import QtQuick

Rectangle{
    id: root
    width: 424
    height: 88
    color: "#151B2E"
    state: stato
    states: [
        State {
            name: "everyday"
            PropertyChanges {
                target: orario
                anchors.verticalCenter: parent.verticalCenter
            }
            PropertyChanges {
                target: giorno
                text: qsTr("")
            }
        },
        State {
            name: "others"
            PropertyChanges {
                target: orario
                anchors.bottom: root.bottom
                anchors.bottomMargin: 12
            }
            PropertyChanges {
                target: giorno
                anchors.top: root.top
                anchors.topMargin: 12
            }
        }
    ]

    Rectangle{
        id: lineaSu
        width: root.width
        height: 1
        color: "#1B2F46"
        anchors.horizontalCenter: root.horizontalCenter
    }
    Rectangle{
        id: lineaGiu
        width: root.width
        height: 1
        color: "#1B2F46"
        anchors.top: root.bottom
        anchors.topMargin: 1
    }

    Image {
        id: bottone
        source: model.isSelected ? "/assets/check_selected.svg" : "/assets/check_disabled.svg"
        anchors.verticalCenter: root.verticalCenter
        anchors.left: root.left
        anchors.leftMargin: 14.5

        MouseArea{
            anchors.fill: parent
            onClicked: isSelected = !isSelected
        }
    }

    MouseArea{
        anchors.fill: parent
        anchors.leftMargin: 60
        anchors.rightMargin: 140
        onClicked: stackView.push(pageSetAlarm)
    }

    Text {
        id: giorno
        text: gio
        color: "#9FAAB0"
        font.pixelSize: 18
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -50
    }
    Text {
        id: orario
        text: ora
        color: "#9FAAB0"
        font.pixelSize: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -50
    }

    AlarmSwitch{
        anchors.verticalCenter: root.verticalCenter
        anchors.right: root.right
        anchors.rightMargin: 14.5
    }

}


