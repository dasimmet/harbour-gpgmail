

import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    id: page
    Column {
        id: cols
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        spacing: 10
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Encrypt a Message:"
        }
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
                py.call("crypt.gpg.encrypt",[textField.text,recipientField.text],function(ret){
                    console.log(ret);
                });
            }
        }
    }
}
