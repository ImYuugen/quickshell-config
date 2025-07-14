//@ pragma UseQApplication

import Quickshell
import "widgets/bar"

ShellRoot {
    id: root
    property bool enableBar: true

    LazyLoader { active: root.enableBar; component: Bar {} }
}
