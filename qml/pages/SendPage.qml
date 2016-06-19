
import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    id: page
    Column {
        id: cols
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        spacing: 10
        TextField{
            id: nameField
            width: page.width
            placeholderText: "ahoi"
        }
        Button{
            anchors.horizontalCenter: parent.horizontalCenter
            text:"Hi"
            onClicked: {
                console.log("Hiho - "+nameField.text)
            }
        }
        Button{
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
