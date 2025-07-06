import Quickshell
import "modules/bar"

ShellRoot {
    id: root
    property bool enableBar: true

    LazyLoader { active: root.enableBar; component: Bar {} }
}
