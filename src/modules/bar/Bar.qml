import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Services.UPower
import Quickshell.Io

Scope {
    id: bar
    property JsonObject config: JsonObject {
        id: barConfig
        property bool top: true
        property bool logging: true
        property int height: 40
        property JsonObject modules: JsonObject {
            property JsonObject workspaces: JsonObject {
                property bool enable: true
                property int shown: 10
                property bool appIcons: true
                property bool monochromeIcons: true
            }
        }
    }
    
    PanelWindow {
        id: barRoot
        WlrLayershell.namespace: "quickshell:bar"
        implicitHeight: barConfig.height
        exclusiveZone: barConfig.height
        // Let background Rectangle handle that
        color: "transparent"
        anchors {
            top: barConfig.top
            bottom: !barConfig.top
            left: true
            right: true
        }
        Item {
            id: barContent
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }
            height: barConfig.height
            implicitHeight: barConfig.height

            // Background
            Rectangle {
                id: barBackground
                anchors {
                    fill: parent
                }
                // FIXME: Temporary
                color: "#202020"
            }
        }
    }
}
