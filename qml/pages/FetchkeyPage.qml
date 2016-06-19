import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    id: page
    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        height: cols.height + 2*Theme.paddingSmall
        width: page.width
        color: Theme.rgba(Theme.highlightBackgroundColor, Theme.highlightBackgroundOpacity)
        radius: Theme.paddingLarge
        Column {
            id: cols
            y: Theme.paddingSmall
            spacing: Theme.paddingMedium
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Find a GPG Key:"
            }
            SearchField{
                id: recipientField
                width: page.width
                placeholderText: "Recipient Email"
                inputMethodHints: Qt.ImhEmailCharactersOnly
            }
            TextField{
                id: keyserverField
                width: page.width
                placeholderText: "keyserver"
                text: py.evaluate("crypt.keyserver")
                onTextChanged:{
                    py.call("crypt.setKeyserver",[text],function(){})
                }
            }
            Button{
                anchors.horizontalCenter: parent.horizontalCenter
                text:"Search"
                onClicked: {
                    py.call("crypt.gpg.search_keys",[recipientField.text,keyserverField.text],function(ret){
                        keyDialog.keyData = ret;
                        keyDialog.open(false,true);
                        selector.currentIndex = ret.length ? 0: -1;
                    })
                }
            }
        }
    }
    Dialog {
        id: keyDialog
        property var keyData:[]
		Flickable {
			// ComboBox requires a flickable ancestor
			width: parent.width
			height: parent.height
			interactive: false
			Column {
				width: parent.width
				DialogHeader {
				title: "Import PGP Keys:"
				}
		        ComboBox {
					id: selector
            		width: parent.width
		            label: 'Found:'
                    visible: keyDialog.keyData.length
    		        currentIndex: -1
		            menu: ContextMenu {
        		        Repeater {
				   			model: keyDialog.keyData
                    		MenuItem {
	                        	text: modelData.uids[0].split("<")[0]
							}
						}
                    }
                }
                Label {
                    text: keyDialog.keyData.length ? "id:"+keyDialog.keyData[selector.currentIndex].keyid : ""
                    wrapMode: Text.Wrap
            		width: parent.width
                }
                Label {
                    text: keyDialog.keyData.length ? "revoked:"+keyDialog.keyData[selector.currentIndex].revoked : ""
                    wrapMode: Text.Wrap
            		width: parent.width
                }
                Label {
                    text: keyDialog.keyData.length ? "date:"+keyDialog.keyData[selector.currentIndex].date : ""
                    wrapMode: Text.Wrap
            		width: parent.width
                }
                Label {
                    text: keyDialog.keyData.length ? "expires:"+keyDialog.keyData[selector.currentIndex].expires : ""
                    wrapMode: Text.Wrap
            		width: parent.width
                }
                Label {
                    text: keyDialog.keyData.length ? "length:"+keyDialog.keyData[selector.currentIndex].length : ""
                    wrapMode: Text.Wrap
            		width: parent.width
                }
                Label {
                    text: keyDialog.keyData.length ? "uids:" : "No keys found"
            		width: parent.width
                }
                Repeater {
                    model: keyDialog.keyData.length ? keyDialog.keyData[selector.currentIndex].uids : []
                    Label {
                        text: modelData
                        wrapMode: Text.Wrap
            		    width: parent.width
                    }
                }
            }
        }
    }
}
