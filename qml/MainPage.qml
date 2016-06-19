import QtQuick 2.2
import Sailfish.Silica 1.0
Page{
    id: page
    Rectangle {
        id: header
        width: page.width
        height: Theme.itemSizeExtraLarge
        color: Theme.rgba(Theme.highlightBackgroundColor, Theme.highlightBackgroundOpacity)
        radius: Theme.paddingLarge
        Rectangle {
            radius: width
            width: parent.width/view.count
            height: width
            x: view.currentIndex*parent.width/view.count
            Behavior on x { PropertyAnimation {} }
        }
    }
    SlideshowView {
        id: view
        anchors.top: header.bottom
        anchors.bottom: page.bottom
        width: page.width
        itemWidth: width
        model: ListModel {
            ListElement {url: "pages/SettingsPage.qml"}
            ListElement {url: "pages/SendPage.qml"}
            ListElement {url: "pages/EncryptPage.qml"}
            ListElement {url: "pages/FetchkeyPage.qml"}
        }
        delegate: Loader {
            width: view.itemWidth-Theme.horizontalPageMargin
            x: Theme.horizontalPageMargin
            anchors.top: view.top
            anchors.bottom: view.bottom
            anchors.topMargin: Theme.horizontalPageMargin
            anchors.bottomMargin: Theme.horizontalPageMargin
            source: model.url
        }
    }
}
