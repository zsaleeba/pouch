import QtQuick 2.4

Item {
    width: 480
    height: 600

    Image {
        id: image
        x: 80
        y: 40
        width: 320
        height: 320
        source: "qr.png"
    }

    Text {
        id: text1
        x: 8
        y: 385
        width: 464
        height: 32
        color: "#ffffff"
        text: "1Agb153xWsbqS9vt8gP4vBFKHkAchLMdSX"
        styleColor: "#ffffff"
        fontSizeMode: Text.FixedSize
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 12
        font.pixelSize: 19
    }
}
