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
        PageAlarmList{
            onToBack: stackView.pop()
            onToSetAlarm: stackView.push(pageSetAlarm)
        }
    }
    Component {
        id: pageSetAlarm
        PageSetAlarm{
            onToBack: stackView.pop()
        }
    }
    Component {
        id: pageTimer
        PageTimer{
            onToBack: stackView.pop()
        }
    }
}
