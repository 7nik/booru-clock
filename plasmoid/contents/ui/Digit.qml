import QtQuick 2.15
import org.kde.plasma.plasmoid

Item {
    id: container
    property int digit
    property real speed
    property int prevDigit: digit
    property real upperHeight: 0
    property real lowerHeight: 0
    property int duration: Plasmoid.configuration.doFlip ? 400 : 0
    property string theme: Plasmoid.configuration.theme

    Behavior on digit {
        SequentialAnimation {
            ScriptAction { script: lowerHeight = 0 }
            NumberAnimation {
                target: container
                property: "upperHeight"
                from: 0; to: 0.5
                duration: container.duration/2
            }
            NumberAnimation {
                target: container
                property: "lowerHeight"
                from: 0; to: 0.5
                duration: container.duration/2
            }
            ScriptAction { script: prevDigit = digit }
        }
    }
    // upper
    Item {
        anchors {
            top: parent.top
            left: parent.left
        }
        width: container.width
        height: container.height * upperHeight
        clip: true
        AnimatedImage {
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
            }
            width: container.width * 0.9
            height: container.height
            source: "../image/digit/"+theme+"/"+digit+".gif"
            speed: container.speed
            smooth: false
        }
    }
    Item {
        anchors {
            top: parent.top
            left: parent.left
            topMargin: container.height * upperHeight
        }
        width: container.width
        height: container.height * (0.5-upperHeight)
        clip: true
        AnimatedImage {
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
            }
            width: container.width * 0.9
            height: container.height * 2*(0.5-upperHeight)
            source: "../image/digit/"+theme+"/"+prevDigit+".gif"
            speed: container.speed
            smooth: false
        }
    }
    // bottom
    Item {
        anchors {
            top: parent.top
            left: parent.left
            topMargin: parent.height/2
        }
        width: container.width
        height: container.height * lowerHeight
        clip: true
        AnimatedImage {
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
            }
            width: container.width * 0.9
            height: container.height * 2*lowerHeight
            source: "../image/digit/"+theme+"/"+digit+".gif"
            speed: container.speed
            smooth: false
        }
    }
    Item {
        anchors {
            bottom: parent.bottom
            left: parent.left
        }
        width: container.width
        height: container.height * (0.5-lowerHeight)
        clip: true
        AnimatedImage {
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
            }
            width: container.width * 0.9
            height: container.height
            source: "../image/digit/"+theme+"/"+prevDigit+".gif"
            speed: container.speed
            smooth: false
        }
    }
}