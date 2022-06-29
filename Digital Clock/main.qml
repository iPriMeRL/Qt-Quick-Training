import QtQuick
import QtQuick.Controls

Window {
    id: root
    width: 480
    height: 800
    visible: true
    title: qsTr("Dial Clock")
    StackView{
        id: stackView
        anchors.fill: parent
        initialItem: pageSetAlarm
    }

    Component{
        id: pageHome
        PageHome{}
    }
    Component {
        id: pageAlarm
        PageAlarm{}
    }
    Component {
        id: pageSetAlarm
        PageSetAlarm{}
    }
}
