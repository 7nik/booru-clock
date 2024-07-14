import QtQuick 2.0
import QtQuick.Layouts
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasma5support as Plasma5Support
import org.kde.plasma.plasmoid

PlasmoidItem {
    id: root

    preferredRepresentation: fullRepresentation

    Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground
    Layout.minimumHeight: 50
    Layout.preferredHeight: 165
    property real ratio: 3+2/30
    implicitWidth: height*ratio
    implicitHeight: width/ratio

    Plasma5Support.DataSource {
        id: timeSource
        engine: "time"
        connectedSources: ["Local"]
        interval: 1000
    }

    fullRepresentation: RowLayout {
        height: root.height
        implicitWidth: height*ratio
        opacity: Plasmoid.configuration.opacity
        layer.enabled: true // apply opacity to the layout but not items (images)

        Tile {
            id: hours
            number: timeSource.data.Local.DateTime.getHours()
            speed: 0.8
        }
        Tile {
            id: minutes
            number: timeSource.data.Local.DateTime.getMinutes()
            speed: 0.95
        }
        Tile {
            id: seconds
            number: timeSource.data.Local.DateTime.getSeconds()
            speed: 1
            visible: Plasmoid.configuration.showSeconds
            enabled: Plasmoid.configuration.showSeconds
        }
    }

}