import QtQuick 2.0
import QtQuick.Scene3D 2.0

Item {
    id: mainview
    width: 1280
    height: 768
    visible: true

    Scene3D {
        anchors.fill: parent
        aspects: ["render", "logic", "input"]

        PlaneSource { id: planesystem }
    }

    function angelChange() {
        planesystem.angle = configBoard.directionAngle
        planesystem.pitchAngle = configBoard.pitchingAngle
        planesystem.rollAngle = configBoard.rollAngle
    }

    ConfigBoard {
        id: configBoard
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 25

       Component.onCompleted: accepted.connect(angelChange)
    }

}
