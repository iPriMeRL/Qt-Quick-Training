import QtQuick

Window {
    width: 1000
    height: 1000
    visible: true
    title: qsTr("Chapters")

    Column {
        id: colonne
        spacing: 20
        anchors.centerIn: parent
        Chapter {
            id: c1
            title: "Capitolo I"
            content: "Quel ramo del lago di Como, che volge a mezzogiorno, tra due catene non interrotte di monti, tutto a seni e a golfi, a seconda dello sporgere e del rientrare di quelli, vien, quasi a un tratto, a ristringersi, e a prender corso e figura di fiume, tra un promontorio a destra, e un’ampia costiera..."
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(c1.state === "def" || c1.state === ""){
                        c2.state = "def"
                        c3.state = "def"
                        c1.state = "expanded"
                    }
                    else if(c1.state === "expanded"){
                        c1.state = "def"
                    }
                }
            }
        }
        Chapter {
            id: c2
            title: "Capitolo II"
            content: "Si racconta che il principe di Condè dormì profondamente la notte avanti la giornata di Rocroi: ma, in primo luogo, era molto affaticato; secondariamente aveva già date tutte le disposizioni necessarie, e stabilito ciò che dovesse fare, la mattina. Don Abbondio in vece non sapeva altro ancora..."
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(c2.state === "def" || c2.state === ""){
                        c1.state = "def"
                        c3.state = "def"
                        c2.state = "expanded"
                    }
                    else {
                        c2.state = "def"
                    }
                }
            }
        }
        Chapter {
            id: c3
            title: "Capitolo III"
            content: "Lucia entrò nella stanza terrena, mentre Renzo stava angosciosamente informando Agnese, la quale angosciosamente lo ascoltava. Tutt’e due si volsero a chi ne sapeva più di loro, e da cui aspettavano uno schiarimento, il quale non poteva essere che doloroso..."
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(c3.state === "def" || c3.state === ""){
                        c1.state = "def"
                        c2.state = "def"
                        c3.state = "expanded"
                    }
                    else {
                        c3.state = "def"
                    }
                }
            }
        }
    }
}
