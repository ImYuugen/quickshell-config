pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    property JsonObject bar: JsonObject {
        property bool top: true
        property int height: 40
        property JsonObject modules: JsonObject {
            property JsonObject hyprland: JsonObject {
                property bool workspaces: true
                property int shownWorkspaces: 10
                property bool appIcons: true
                property bool monochromeIcons: true
                property bool submaps: true
            }
            property JsonObject systray: JsonObject {
                property bool enabled: true
            }
        }
    }
}
