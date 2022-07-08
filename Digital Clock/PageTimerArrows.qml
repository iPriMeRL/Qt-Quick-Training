import QtQuick

Rectangle{
    id: root
    width: 190
    height: 235
    color: "#151B2E"

    Image {
        id: frecciaSu
        source: "/assets/btn-arrow-active.svg"
        anchors.bottom: linea.top
        anchors.bottomMargin: 8
    }
    Image {
        id: frecciaGiu
        source: "/assets/btn-arrow-active.svg"
        rotation: 180
        anchors.top: linea.bottom
        anchors.topMargin: 8
    }

    Rectangle{
        id: linea
        width: root.width
        height: 1
        color: "#1B2F46"
        anchors.verticalCenter: root.verticalCenter
    }
}
