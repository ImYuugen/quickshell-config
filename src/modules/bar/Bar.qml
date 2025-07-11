import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import "root:/config"

Scope {
    id: bar
    
    PanelWindow {
        id: barRoot
        WlrLayershell.namespace: "quickshell:bar"
        implicitHeight: Appearance.bar.height
        exclusiveZone: Appearance.bar.height
        // Let background Rectangle handle that
        color: "transparent"
        anchors {
            top: Appearance.bar.top
            bottom: !Appearance.bar.top
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
            height: Appearance.bar.height
            implicitHeight: Appearance.bar.height

            // Background
            Rectangle {
                id: barBackground
                anchors {
                    fill: parent
                }
                // FIXME: Temporary
                color: "#202020"
            }

            // Left section
            RowLayout {
                id: leftSection
                anchors.left: parent.left
                BarGroup {}
                // OS Icon (Power menu)
                // Window name
            }
            // Center section
            RowLayout {
                id: centerSection
                anchors.centerIn: parent
                BarGroup {
                    id: middleCenterGroup
                    Layout.fillHeight: true

                    // Media info
                    // Workspaces
                    Workspaces {
                        id: hyprlandWidget
                        bar: barRoot
                        Layout.fillHeight: true
                    }
                    // Time
                    Clock {}
                }
            }
            // Right section
            RowLayout {
                id: rightSection
                anchors.right: parent.right
                BarGroup {
                    // System Info
                    // Top right corner: system tray
                    SysTray {
                        bar: barRoot
                        Layout.fillWidth: false
                        Layout.fillHeight: true
                    }
                }
            }
        }
    }
}
