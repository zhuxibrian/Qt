import QtQuick 2.0

Item {
    id: configBoard
    property double directionAngle: 0.0
    property double pitchingAngle: 0.0
    property double rollAngle: 0.0
    width: 180
    height: 120

    signal accepted

    Grid {
        id: grid
        width: 100
        height: 100
        spacing: 20
        rows: 3
        columns: 2
        anchors.fill: parent

        function getAngleConfig() {
            directionAngle = directionAngleInput.text
            pitchingAngle = pitchingAngleInput.text
            rollAngle = rollAngleInput.text
            configBoard.accepted()
        }

        Text {
            id: text1
            text: qsTr("方向角")
            font.pixelSize: 12
        }

        TextInput {
            id: directionAngleInput
            width: 80
            height: 20
            text: directionAngle
            font.pixelSize: 12
            onAccepted: grid.getAngleConfig()
        }

        Text {
            id: text2
            text: qsTr("俯仰角")
            font.pixelSize: 12
        }

        TextInput {
            id: pitchingAngleInput
            width: 80
            height: 20
            text: pitchingAngle
            font.pixelSize: 12
            onAccepted: grid.getAngleConfig()
        }

        Text {
            id: text3
            text: qsTr("翻滚角")
            font.pixelSize: 12
        }

        TextInput {
            id: rollAngleInput
            width: 80
            height: 20
            text: rollAngle
            font.pixelSize: 12
            onAccepted: grid.getAngleConfig()
        }


    }




}
