import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 480
    height: 640
    title: qsTr("pouch")
    
    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        
        Page {
            Label {
                text: qsTr("Summary page")
                anchors.centerIn: parent
            }
        }
        
        ReceivePage {
        }
        
        PayPage {
        }
        
        Page {
            Label {
                text: qsTr("Second page")
                anchors.centerIn: parent
            }
        }
    }
    
    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        font.capitalization: Font.MixedCase 
        
        TabButton {
            text: qsTr("Summary")
        }
        TabButton {
            text: qsTr("Receive")
        }
        TabButton {
            text: qsTr("Pay")
        }
        TabButton {
            text: qsTr("Exchange")
        }
    }
}
