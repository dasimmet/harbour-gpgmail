import QtQuick 2.0
import Sailfish.Silica 1.0
import io.thp.pyotherside 1.4
//import "pages"

ApplicationWindow
{
    id: "app"
    initialPage: MainPage{}
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    Component.onCompleted: {
        app.initialPage = Qt.resolvedUrl("MainPage.qml");
    }
    Python {
        id: py

        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('./pyLib'));

            setHandler('progress', function(ratio) {
            });
            setHandler('finished', function(newvalue) {
            });

            importModule('crypt', function () {});

        }

        onError: {
            // when an exception is raised, this error handler will be called
            console.log('python error: ' + traceback);
        }

        onReceived: {
            // asychronous messages from Python arrive here
            // in Python, this can be accomplished via pyotherside.send()
            console.log('got message from python: ' + data);
        }
    }
}


