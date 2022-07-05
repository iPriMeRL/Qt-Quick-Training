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
        initialItem: pageHome
    }

    Component{
        id: pageHome
        PageHome{}
    }
    Component {
        id: pageAlarmList
        PageAlarmList{}
    }
    Component {
        id: pageSetAlarm
        PageSetAlarm{}
    }
    Component {
        id: pageTimer
        PageTimer{}
    }
}
