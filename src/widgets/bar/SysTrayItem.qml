import QtQuick
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets

MouseArea {
    id: root
    required property var bar
    required property SystemTrayItem item

    property int trayItemSize: 16
    implicitHeight: trayItemSize
    implicitWidth: trayItemSize

    acceptedButtons: Qt.LeftButton | Qt.RightButton

    onClicked: (event) => {
        switch (event.button) {
        case Qt.LeftButton:
            item.activate();
            break;
        case Qt.RightButton:
            if (item.hasMenu) menu.open();
            break;
        }
    }

    QsMenuAnchor {
        id: menu

        menu: root.item.menu
        anchor.item: root
    }

    IconImage {
        id: trayIcon

        implicitSize: root.trayItemSize
        anchors.centerIn: parent

        source: {
            let icon = root.item.icon;
            if (icon.includes("?path=")) {
                const [name, path] = icon.split("?path=");
                icon = `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`;
            }
            return icon;
        }
        asynchronous: true
    }
}
