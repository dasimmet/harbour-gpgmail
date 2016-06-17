
import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    id: page
    anchors.margins: 10
    Column {
        id: cols
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
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
