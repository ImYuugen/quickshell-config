import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.config
import qs.widgets.utils

Item {
    id: root
    implicitWidth: rowLayout.implicitWidth
    implicitHeight: 32
    readonly property list<string> youbi: ['日', '月', '火', '水', '木', '金', '土'];

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    // TODO: Styling
    RowLayout {
        id: rowLayout
        anchors.centerIn: parent
        spacing: 4

        StyledText {
            id: kanjiDay
            font.pixelSize: Appearance.font.size.mezzobig
            text: {
                root.youbi[clock.date.getDay()]
            }
        }

        ColumnLayout {
            StyledText {
                id: date
                font.pixelSize: Appearance.font.size.mezzosmall
                text: Qt.formatDate(clock.date, "dd/MM")
            }

            StyledText {
                id: time
                font.pixelSize: Appearance.font.size.mezzosmall
                text: Qt.formatTime(clock.date, "hh:mm")
            }
        }
    }
}
