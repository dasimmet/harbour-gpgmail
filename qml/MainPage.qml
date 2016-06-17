import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
Page{
    id: page
    Rectangle {
        id: header
        width: parent.width
        height: 100
    }
    SlideshowView {
        id: view
        anchors.top: header.top
        anchors.bottom: page.bottom
        width: parent.width
        itemWidth: width
        model: ListModel {
            ListElement {url: "pages/SettingsPage.qml"}
            ListElement {url: "pages/SendPage.qml"}
            ListElement {url: "pages/EncryptPage.qml"}
        }
        delegate: Loader {
            width: view.itemWidth
            height: view.height
            source: model.url
        }
    }
}
