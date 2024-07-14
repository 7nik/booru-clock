import QtQuick 2.15
import QtQuick.Layouts

Item {
    property int number
    property real speed
    property int margin: parent.height/40

    Layout.minimumHeight: 50
    Layout.minimumWidth: 50
    Layout.fillHeight: true
    implicitWidth: height

    Image {
        anchors.fill: parent
        source: "../image/back.png"
            smooth: false
    }
    Digit {
        anchors {
            top: parent.top
            left: parent.left
            bottom: parent.bottom
            margins: margin
            rightMargin: 0
        }
        width: parent.width/2
        digit: Math.floor(number/10)
        speed: parent.speed-0.25
    }
    Digit {
        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
            margins: margin
            leftMargin: 0
        }
        width: parent.width/2
        digit: number%10
        speed: parent.speed
    }
}