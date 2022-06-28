import QtQuick

Rectangle{
    id: root
    width: 480
    height: 800
    color: "#151B2E"

    Button2{
        id: del
        anchors.left: root.left
        anchors.leftMargin: 23
        anchors.top: root.top
        anchors.topMargin: 706
        testo: "DELETE"
        color: "#151B2E"
        opacity: contaSel() ? 1 : 0
    }

    Image {
        id: goBack
        source: "/assets/btn-back-hover.svg"
        anchors.left: root.left
        anchors.top: root.top
        anchors.leftMargin: 28
        anchors.topMargin: 20
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
        anchors.top: root.top
        anchors.topMargin: 135
        anchors.left: root.left
        anchors.leftMargin: 38
        font.pixelSize: 20
        color: "#FCB647"
    }

    Text {
        id: others
        text: qsTr("Others")
        anchors.top: root.top
        anchors.topMargin: 410
        anchors.left: root.left
        anchors.leftMargin: 38
        font.pixelSize: 20
        color: "#FCB647"
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
        delegate: PageAlarmComponent{}
        anchors.leftMargin: 28.5
        anchors.topMargin: everyday.anchors.topMargin + 40
        anchors.bottomMargin: 400
        clip: true
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
        delegate: PageAlarmComponent{}
        anchors.leftMargin: 28.5
        anchors.topMargin: others.anchors.topMargin + 40
        anchors.bottomMargin: 100
        clip: true
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
