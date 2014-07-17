import QtQuick 2.2
import QtQuick.Controls 1.2
import QtMultimedia 5.0
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id: mainWindow
    visible: true
    title: qsTr("Multimedia Player")

    signal qmlSignal(string msg)

    function qmlSlot(msg) {
        console.debug(msg.toString());
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Open")
                onTriggered: {
                    mediaplayer.stop();
                    fileDialog.folder = "file:///sdcard/";
                    fileDialog.open();
                    mainWindow.qmlSignal("Hello from QML");
                }
            }
            MenuItem {
                text: qsTr("Play")
                onTriggered: {
                    mediaplayer.play();
                }
            }
            MenuItem {
                text: qsTr("Pause")
                onTriggered: mediaplayer.pause();
            }
            MenuItem {
                text: qsTr("Stop")
                onTriggered: mediaplayer.stop();
            }
            MenuItem {
                text: qsTr("Audio streaming")
                onTriggered: {
                    mediaplayer.stop();
                    mediaplayer.source = "http://208.92.53.75:3690/M80RADIO";
                    mediaplayer.play();
                }
            }
            MenuItem {
                text: qsTr("Video streaming (Not working)")
                onTriggered: {
                    mediaplayer.stop();
                    mediaplayer.source = "http://www.blomdalen.no/files/2009/03/0-mvi_1310.avi";
                    mediaplayer.play();
                }
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    MediaPlayer {
        id: mediaplayer
    }

    VideoOutput {
        id: videoOut
        anchors.fill: parent
        source: mediaplayer
    }

    FileDialog {
        id: fileDialog
        title: "Select video file to open"
        nameFilters: [ "Video files (*.mp4 *.avi)", "All files (*)" ]

        onSelectionAccepted: {
            mediaplayer.source = fileUrl.toString();
        }
    }

}
