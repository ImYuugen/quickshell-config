pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Hyprland
import "root:/config"

Item {
    required property var bar
    readonly property HyprlandMonitor monitor: Hyprland.monitorFor(bar.screen)

    id: root
    visible: Appearance.bar.modules.hyprland.workspaces
    property int shownWorkspaces: 10
    property int workspaceButtonWidth: 30
    property list<bool> workspaceOccupied: []

    function updateWorkspaceOccupied() {
        root.workspaceOccupied = Array.from(
            Array(root.shownWorkspaces),
            () => false
        );
        Hyprland.workspaces.values.forEach(ws => {
            const id = ws.id - 1
            if (id < 0 || id >= root.shownWorkspaces) { return; }
            root.workspaceOccupied[id] = true;
        });
    }
    Component.onCompleted: updateWorkspaceOccupied()
    
    Connections {
        target: Hyprland.workspaces
        function onValuesChanged() {
            root.updateWorkspaceOccupied()
        }
    }

    implicitWidth: rowLayout.implicitWidth + rowLayout.spacing * 2
    implicitHeight: parent.height

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.MiddleButton
        onPressed: (event) => {
            Hyprland.dispatch("togglespecialworkspace");
        }
    }

    RowLayout {
        id: rowLayout
        z: 1

        spacing: 0
        anchors.fill: parent
        implicitHeight: parent.height

        Repeater {
            model: root.shownWorkspaces

            Rectangle {
                required property int index
                z: 1
                implicitWidth: root.workspaceButtonWidth
                implicitHeight: root.workspaceButtonWidth
                radius: 5
                color: root.workspaceOccupied[index] ? "white" : "black"
            }
        }
    }
    RowLayout {
        id: rowLayoutNumbers
        z: 3

        spacing: 0
        anchors.fill: parent
        implicitHeight: parent.height

        Repeater {
            model: root.shownWorkspaces
            Button {
                required property int index
                id: button
                Layout.fillHeight: true
                width: root.workspaceButtonWidth
                onPressed: Hyprland.dispatch(`workspace ${index + 1}`)
                background: Item {
                    id: workspaceButtonBackground
                    implicitWidth: root.workspaceButtonWidth
                    implicitHeight: root.workspaceButtonWidth
                }
            }
        }
    }
}
