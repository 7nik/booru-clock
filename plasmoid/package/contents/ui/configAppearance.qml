import QtQuick 2.15
import QtCore
import QtQuick.Controls as QtControls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Kirigami.FormLayout {
    property alias cfg_showSeconds: showSecondsCheckBox.checked
    property alias cfg_doFlip: doFlipCheckBox.checked
    property alias cfg_opacity: opacitySlider.value
    property string cfg_theme

    property var cfg_showSecondsDefault
    property var cfg_doFlipDefault
    property var cfg_themeDefault
    property var cfg_opacityDefault

    property var themes: ["asoul", "gelbooru", "moebooru", "rule34"]

    Kirigami.FormLayout {
        RowLayout {
            QtControls.CheckBox {
                id: showSecondsCheckBox
                text: i18n("Show seconds")
            }
        }
        RowLayout {
            QtControls.CheckBox {
                id: doFlipCheckBox
                text: i18n("Flip the digits")
            }
        }
        RowLayout {
            QtControls.Label {
                text: i18n("Digits theme:")
            }
            QtControls.ComboBox {
                id: themeComboBox
                model: themes
                currentIndex: themes.indexOf(cfg_theme)
                onCurrentIndexChanged: cfg_theme = themes[themeComboBox.currentIndex]
            }
        }
        RowLayout {
            Kirigami.FormData.label: i18n("Widget opacity:")
            QtControls.Slider {
                id: opacitySlider
            }
            QtControls.Label {
                text: Math.round(opacitySlider.value*100).toString()
            }
        }
    }
}