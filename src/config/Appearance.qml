pragma Singleton
import QtQuick
import Quickshell

Singleton {
    id: root
    property QtObject font
    property QtObject options

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
    
    options: QtObject {
        property bool darkmode: false
        property bool transparent: false
    }
}
