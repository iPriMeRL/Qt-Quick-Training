import QtQuick

Rectangle {
    id: root
    width: 600
    height: 100
    color: "grey"
    property string title: ""
    property string content: ""
    states: [
        State {
            name: "def"
            PropertyChanges {
                target: contenuto
                opacity: 0
            }
        },
        State {
            name: "expanded"
            PropertyChanges {
                target: contenuto
                opacity: 1
            }
            PropertyChanges {
                target: root
                height: 500
            }
        }
    ]

    Item {
        id: itTit
        width: 600
        height: 100
        Text {
            id: titolo
            text: root.title
            color: "white"
            anchors.centerIn: parent
        }
    }

    Item {
        id: itCont
        width: 600
        height: 400
        anchors.top: itTit.bottom
        Text {
            id: contenuto
            color: "white"
            text: root.content
            opacity: 0
            anchors.top: parent.top
            anchors.left: parent.left
            width: parent.width
            height: parent.height
            wrapMode: Text.WordWrap
        }
    }

    Behavior on height {
        NumberAnimation {
            duration: 300
        }
    }

    OpacityAnimator on opacity {
        target: contenuto
        from: 0;
        to: 1;
        duration: 300
    }

}
