pragma Singleton
import QtQuick
import Quickshell

Singleton {
    id: root
    property QtObject font
    property QtObject theme
    property alias colors: colors

    font: QtObject {
        property QtObject family: QtObject {
            property string mono: "Moralerspace Xenon NF"
        }
        property QtObject size: QtObject {
            property int smallississimo: 6
            property int smallissimo: 8
            property int small: 10
            property int mezzosmall: 12
            property int regular: 14
            property int mezzobig: 16
            property int big: 18
            property int bigissimo: 20
            property int bigississimo: 22
        }
    }

    theme: QtObject {
        id: theme
        property bool darkmode: true
        property QtObject colors: QtObject {
            id: colors
            // Does this take up more memory than an alias ?
            default property QtObject mode: theme.darkmode ? dark : light;
            //
            property color layer0: mode.layer0
            property color layer1: mode.layer1
            // TODO: Colors
            property QtObject light: QtObject {
                property color layer0: "#FFFFFF"
                property color layer1: "#CCCCCC"
            }
            property QtObject dark: QtObject {
                property color layer0: "#111111"
                property color layer1: "#333333"
            }
        }
    }
}
