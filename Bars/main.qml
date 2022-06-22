import QtQuick

Window {
    id: root
    width: 1080
    height: 720
    visible: true
    title: qsTr("Bars")

    Column {
        id: colonne
        spacing: 20
        anchors.centerIn: parent
        Bar {
            id: bar1
        }
        Bar {
            id: bar2
        }
        Bar {
            id: bar3
        }
        Bar {
            id: bar4
        }
        Bar {
            id: bar5
        }
    }
}
