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
        implicitHeight: Config.bar.height
        exclusiveZone: Config.bar.height
        // Let background Rectangle handle that
        color: "transparent"
        anchors {
            top: Config.bar.top
            bottom: !Config.bar.top
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

            // Background
            Rectangle {
                id: barBackground
                anchors {
                    fill: parent
                }
                color: Appearance.colors.layer0;
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
                    Battery {}
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
