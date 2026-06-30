// ponytail: peak-hour indicator for Plasma 6 panel.
// Computes UTC hour directly in JS — no subprocess, no script needed.
// Peak windows (UTC): 01:00–04:00 and 06:00–10:00
// Shows DeepSeek whale logo — full color off-peak, dimmed + red dot when peak.

import QtQuick
import org.kde.plasma.plasmoid

PlasmoidItem {
    id: root
    property bool isPeak: false

    // ponytail: hardcoded effective date — update when actual date is announced.
    property date effectiveDate: new Date(Date.UTC(2026, 6, 16)) // July 16, 2026 UTC

    function update() {
        var now = new Date();
        if (now < effectiveDate) {
            root.isPeak = false;
            return;
        }
        var h = now.getUTCHours();
        root.isPeak = (h >= 1 && h < 4) || (h >= 6 && h < 10);
    }

    compactRepresentation: Item {
        anchors.fill: parent
        Image {
            anchors.centerIn: parent
            width: Math.min(parent.width, parent.height) * 0.8
            height: width
            source: Qt.resolvedUrl("../images/deepseek.png")
            fillMode: Image.PreserveAspectFit
            opacity: root.isPeak ? 0.4 : 1.0
        }
        Rectangle {
            visible: root.isPeak
            anchors.top: parent.top
            anchors.right: parent.right
            width: 8
            height: 8
            radius: 4
            color: "#e04040"
        }
    }

    fullRepresentation: Text {
        text: root.isPeak ? "⚠ Peak hours (UTC 01–04 / 06–10)" : "✓ Off-peak"
        font.pixelSize: 16
        padding: 20
        color: root.isPeak ? "#e04040" : "#4d9d2f"
    }

    Timer {
        interval: 30000
        running: true
        repeat: true
        onTriggered: root.update()
    }

    Component.onCompleted: root.update()
}
