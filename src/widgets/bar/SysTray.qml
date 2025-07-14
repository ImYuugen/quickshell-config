pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray
import "root:/config"

Item {
    id: root
    visible: Config.bar.modules.systray.enabled

    required property var bar

    height: parent.height
    implicitWidth: rowLayout.implicitWidth

    RowLayout {
        id: rowLayout
        anchors.fill: parent
        spacing: 15
        Repeater {
            model: SystemTray.items
            SysTrayItem {
                required property SystemTrayItem modelData
                bar: root.bar
                item: modelData
            }
        }

        // TODO: Reveal systray window
        Text {
            Layout.alignment: Qt.AlignVCenter
            font.pixelSize: 16
            color: "red"    
            text: "v"
            visible: {
                SystemTray.items.values.length > 0
            }
        }
    }
}
