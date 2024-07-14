import QtQuick 2.15

import org.kde.plasma.configuration

ConfigModel {
    ConfigCategory {
        name: i18nc("@title", "Apperance")
        icon: "preference-desktop-colo"
        source: "configAppearance.qml"
    }
}