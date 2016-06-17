

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
            id: recipientField
            width: page.width
            placeholderText: "Recipient"
        }
        TextArea{
            id: textField
            width: page.width
            height: page.height/2
            placeholderText: "Type your Message here"
        }
        Button{
            anchors.horizontalCenter: parent.horizontalCenter
            text:"Hi"
            onClicked: {
                console.log("Hiho - "+recipientField.text);
                console.log(py);
            }
        }
    }
}
