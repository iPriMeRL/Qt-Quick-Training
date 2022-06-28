import QtQuick

Component{
    id: root
    Rectangle{
        id: rect
        width: 424
        height: 88
        color: "#151B2E"
        property bool isActive: false
        property int countSelected: 0
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
                    anchors.bottom: rect.bottom
                    anchors.bottomMargin: 12
                }
                PropertyChanges {
                    target: giorno
                    anchors.top: rect.top
                    anchors.topMargin: 12
                }
            }
        ]

        Rectangle{
            id: lineaSu
            anchors.horizontalCenter: rect.horizontalCenter
            color: "#1B2F46"
            width: rect.width
            height: 1
        }
        Rectangle{
            id: lineaGiu
            anchors.top: rect.bottom
            anchors.topMargin: 1
            color: "#1B2F46"
            width: rect.width
            height: 1
        }

        Image {
            id: bottone
            source: model.isSelected ? "/assets/check_selected.svg" : "/assets/check_disabled.svg"
            anchors.verticalCenter: rect.verticalCenter
            anchors.left: rect.left
            anchors.leftMargin: 14.5
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
            anchors.verticalCenter: rect.verticalCenter
            anchors.right: rect.right
            anchors.rightMargin: 14.5
        }

        MouseArea{
            anchors.fill: bottone
            onClicked: isSelected != isSelected
        }
    }
}


