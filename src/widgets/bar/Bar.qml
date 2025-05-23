import Quickshell
import QtQuick
import QtQuick.Controls

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }
    implicitHeight: 40
    color: "#CC000000"

    Label {
        id: skibidi
        anchors.centerIn: parent
        text: "Skibidi"
        color: "#FFFFFFFF"
    }
}
