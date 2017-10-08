import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.0

Item {
    width: 480
    height: 600

    Text {
        id: text1
        x: 54
        y: 62
        width: 185
        height: 37
        color: "#cccccc"
        text: qsTr("Who to pay")
        font.weight: Font.Bold
        font.pixelSize: 24
    }

    Text {
        id: text3
        x: 54
        y: 214
        width: 185
        height: 37
        color: "#cccccc"
        text: qsTr("Amount")
        font.pixelSize: 24
        font.weight: Font.Bold
    }

    Text {
        id: text4
        x: 227
        y: 257
        width: 52
        height: 37
        color: "#cccccc"
        text: qsTr("BTC")
        font.pixelSize: 24
        font.weight: Font.Bold
    }

    Button {
        id: button
        x: 310
        y: 105
        text: qsTr("Contacts")
    }

    Button {
        id: button2
        x: 406
        y: 105
        text: qsTr("Scan")
    }

    TextField {
        id: textField
        x: 54
        y: 105
        width: 250
        height: 48
    }

    TextField {
        id: textField1
        x: 54
        y: 257
        width: 167
        height: 37
    }

    Text {
        id: text5
        x: 227
        y: 300
        width: 52
        height: 37
        color: "#cccccc"
        text: qsTr("USD")
        font.pixelSize: 24
        font.weight: Font.Bold
    }

    Text {
        id: text6
        x: 54
        y: 391
        width: 185
        height: 37
        color: "#cccccc"
        text: qsTr("Fees")
        font.pixelSize: 24
        font.weight: Font.Bold
    }

    Text {
        id: text7
        x: 54
        y: 300
        width: 167
        height: 37
        color: "#cccccc"
        text: qsTr("12.34")
        font.pixelSize: 24
        font.weight: Font.Bold
    }

    Text {
        id: text8
        x: 54
        y: 457
        width: 167
        height: 37
        color: "#cccccc"
        text: qsTr("1.23")
        font.pixelSize: 24
        font.weight: Font.Bold
    }

    Text {
        id: text9
        x: 227
        y: 457
        width: 52
        height: 37
        color: "#cccccc"
        text: qsTr("USD")
        font.pixelSize: 24
        font.weight: Font.Bold
    }

    Slider {
        id: slider
        x: 54
        y: 426
        width: 167
        height: 25
        value: 0.5
    }
}
