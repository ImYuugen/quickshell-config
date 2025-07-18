pragma Singleton

import QtQuick
import Quickshell

Singleton {
    property QtObject bar: QtObject {
        property bool top: true
        property int height: 40
        property QtObject modules: QtObject {
            property QtObject hyprland: QtObject {
                property bool workspaces: true
                property int shownWorkspaces: 10
                property bool appIcons: true
                property bool monochromeIcons: true
                property bool submaps: true
            }
            property QtObject systray: QtObject {
                property bool enabled: true
            }
        }
    }
}
