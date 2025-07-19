pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.config

Item {
    required property var bar
    readonly property HyprlandMonitor monitor: Hyprland.monitorFor(bar.screen)

    id: root
    visible: Config.bar.modules.hyprland.workspaces
    property int shownWorkspaces: 10
    property int workspaceButtonWidth: 30
    property list<HyprlandWorkspace> workspaces: Hyprland.workspaces.values
 
    Connections {
        target: Hyprland.workspaces
    }

    implicitWidth: rowLayout.implicitWidth + rowLayout.spacing * 2
    implicitHeight: parent.height

    RowLayout {
        id: rowLayout
        z: 1

        spacing: 2
        anchors.fill: parent
        implicitHeight: parent.height

        Repeater {
            model: root.shownWorkspaces

            Item {
                id: repRoot
                required property int index
                implicitWidth: wsRect.implicitWidth
                implicitHeight: wsRect.implicitHeight
                Button {
                    id: button
                    Layout.fillHeight: true
                    width: root.workspaceButtonWidth
                    onPressed: Hyprland.dispatch(`workspace ${repRoot.index + 1}`)
                    background: Rectangle {
                        id: wsRect
                        z: 1
                        implicitWidth: root.workspaceButtonWidth
                        implicitHeight: root.workspaceButtonWidth
                        radius: implicitWidth / 2
                        color: {
                            // TODO: Find a more efficient way ?
                            if (Hyprland.focusedWorkspace.id === repRoot.index + 1) {
                                return "red";
                            }
                            else if (root.workspaces.some(ws => ws.id === repRoot.index + 1)) {
                                return "white";
                            }
                            else {
                                return "black";
                            }
                        }
                    }
                }
            }
        }
    }
}
