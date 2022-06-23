import QtQuick

Rectangle {
    id: root
    width: 190
    height: 64
    radius: 32
    border.color: "#FCB647"
    border.width: 1
    property string testo: ""
    property string colTesto: ""
    states: [
        State {
            name: "active"
            PropertyChanges {
                target: root
                opacity: 1
                colTesto: "#FCB647"
            }
        },
        State {
            name: "hover"
            PropertyChanges {
                target: root
                opacity: 1
                color: "#FCB647"
                colTesto: "black"
            }
        }
    ]

    Text {
        id: txt
        text: root.testo
        color: root.colTesto
        font.family: "Ubuntu Light"
        anchors.centerIn: root
        font.letterSpacing: 1.8
        anchors.topMargin: 14
        anchors.bottomMargin: 14
        font.pixelSize: 30
    }

    MouseArea{
        anchors.fill: root
        onClicked: {
            if(root.state === "active"){
                root.state = "hover"
            }
            else{
                root.state = "active"
            }
        }
    }
}
