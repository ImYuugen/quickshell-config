import QtQuick
import QtQuick.Layouts
import "root:/config"

Item {
    id: root
    property real padding: 4
    implicitHeight: Appearance.bar.height
    height: Appearance.bar.height
    implicitWidth: rowLayout.implicitWidth + padding * 2
    default property alias items: rowLayout.children

    Rectangle {
        id: background
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            right: parent.right
        }
        color: "red"
    }

    RowLayout {
        id: rowLayout
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            right: parent.right
            leftMargin: root.padding
            rightMargin: root.padding
        }
        spacing: 4
    }
}
