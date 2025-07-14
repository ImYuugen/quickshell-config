import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower

Item {
    id: root
    visible: UPower.displayDevice.isLaptopBattery

    readonly property var state: UPower.displayDevice.state
    readonly property var charging: state === UPowerDeviceState.Charging
    readonly property real percentage: UPower.displayDevice.percentage

    implicitWidth: rowLayout.implicitWidth + rowLayout.spacing * 2
    implicitHeight: 32

    RowLayout {
        id: rowLayout

        spacing: 4
        anchors.centerIn: parent

        Text {
            Layout.alignment: Qt.AlignVCenter
            text: Math.round(root.percentage * 100)
        }
    }
}
