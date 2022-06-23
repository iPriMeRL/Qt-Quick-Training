import QtQuick

Rectangle {
    id: root
    width: 112
    height: 60
    radius: 8
    Image {
        id: navicellaOn
        source: "/assets/switch-on-selected.svg"
        opacity: 0
    }
    Image {
        id: tastoOn
        source: "file"
        opacity: 0
    }
    Image {
        id: navicellaOff
        source: "file"
        opacity: 1
    }
    Image {
        id: tastoOff
        source: "file"
        opacity: 1
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if(tastoOff.opacity === 1){
                tastoOff.opacity = 0
                navicellaOff.opacity = 0
                tastoOn.opacity = 1
                navicellaOn.opacity = 1
            }
            else{
                tastoOn.opacity = 0
                navicellaOn.opacity = 0
                tastoOff.opacity = 1
                navicellaOff.opacity = 1
            }
        }
    }
}
