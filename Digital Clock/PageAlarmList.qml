import QtQuick

Rectangle{
    id: root
    width: 480
    height: 800
    color: "#151B2E"

    Button434x64{
        id: del
        testo: "DELETE"
        color: "#151B2E"
        state: "active"
        opacity: contaSel() ? 1 : 0
        anchors.left: root.left
        anchors.leftMargin: 23
        anchors.top: root.top
        anchors.topMargin: 706
    }

    Image {
        id: goBack
        source: "/assets/btn-back-hover.svg"
        anchors.left: root.left
        anchors.top: root.top
        anchors.leftMargin: 28
        anchors.topMargin: 20

        MouseArea{
            anchors.fill: parent
            onClicked: stackView.pop()
        }
    }

    Text {
        id: alClockList
        text: qsTr("Alarm Clock List")
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

    Text {
        id: everyday
        text: qsTr("Everyday")
        color: "#FCB647"
        font.pixelSize: 20
        anchors.top: root.top
        anchors.topMargin: 135
        anchors.left: root.left
        anchors.leftMargin: 38
    }

    Text {
        id: others
        text: qsTr("Others")
        color: "#FCB647"
        font.pixelSize: 20
        anchors.top: root.top
        anchors.topMargin: 410
        anchors.left: root.left
        anchors.leftMargin: 38
    }

    ListModel{
        id: everyList
        ListElement{
            gio: "27/06/2022"
            ora: "16:30"
            stato: "everyday"
            isSelected: false
        }
        ListElement{
            gio: "27/06/2022"
            ora: "16:21"
            stato: "everyday"
            isSelected: false
        }
    }

    ListView{
        anchors.fill: parent
        model: everyList
        delegate: PageAlarmListComponent{}
        clip: true
        anchors.leftMargin: 28.5
        anchors.topMargin: everyday.anchors.topMargin + 40
        anchors.bottomMargin: 400
    }

    ListModel{
        id: othList
        ListElement{
            gio: "27/06/2022"
            ora: "16:30"
            stato: "others"
            isSelected: false
        }
        ListElement{
            gio: "27/06/2022"
            ora: "16:21"
            stato: "others"
            isSelected: false
        }
    }

    ListView{
        anchors.fill: parent
        model: othList
        delegate: PageAlarmListComponent{}
        clip: true
        anchors.leftMargin: 28.5
        anchors.topMargin: others.anchors.topMargin + 40
        anchors.bottomMargin: 100
    }

    MouseArea{
        anchors.fill: del
        onClicked: {
            if(del.opacity === 1){
                for(var i=0; i<everyList.count; i++){
                    if(everyList.get(i).isSelected){
                        everyList.remove(i)
                        i--
                    }
                }
                for(i=0; i<othList.count; i++){
                    if(othList.get(i).isSelected){
                        othList.remove(i)
                        i--
                    }
                }
            }
        }
    }

    function contaSel(){
        for(var i=0; i<everyList.count; i++){
            if(everyList.get(i).isSelected) return true
        }
        for(i=0; i<othList.count; i++){
            if(othList.get(i).isSelected) return true
        }
        return false
    }
}
