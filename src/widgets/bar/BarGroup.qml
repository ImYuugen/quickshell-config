import QtQuick
import QtQuick.Layouts
import "root:/config"

Item {
    id: root
    property real padding: 4
    implicitHeight: Config.bar.height
    height: Config.bar.height
    implicitWidth: rowLayout.implicitWidth + padding * 2
    default property alias items: rowLayout.children

    Rectangle {
        id: background
        anchors {
            fill: parent
            topMargin: 4
            bottomMargin: 4
        }
        color: Appearance.colors.layer1
    }

    RowLayout {
        id: rowLayout
        height: parent.height
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
