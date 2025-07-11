import QtQuick
import QtQuick.Layouts
import Quickshell
import "root:/config"

Item {
    id: root
    implicitWidth: rowLayout.implicitWidth
    implicitHeight: 32
    readonly property list<string> youbi: ['月', '火', '水', '木', '金', '土', '日'];

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    // TODO: Styling
    RowLayout {
        id: rowLayout
        anchors.centerIn: parent
        spacing: 4

        Text {
            id: kanjiDay
            font.pixelSize: Appearance.font.size.mezzobig
            text: root.youbi[clock.date.getDay() - 1]
        }

        ColumnLayout {
            Text {
                id: date
                font.pixelSize: Appearance.font.size.mezzosmall
                text: Qt.formatDate(clock.date, "dd/MM")
            }

            Text {
                id: time
                font.pixelSize: Appearance.font.size.mezzosmall
                text: Qt.formatTime(clock.date, "hh:mm")
            }
        }
    }
}
