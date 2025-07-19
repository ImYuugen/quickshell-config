import QtQuick
import qs.config

Text {
    renderType: Text.NativeRendering
    verticalAlignment: Text.AlignVCenter
    font {
        hintingPreference: Font.PreferFullHinting
        family: Appearance.font.family.mono ?? "sans-serif"
        pixelSize: Appearance.font.size.regular ?? 14
    }
}
