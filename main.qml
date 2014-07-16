import QtQuick 2.2
import QtQuick.Controls 1.1
import QtMultimedia 5.0
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    title: qsTr("Multimedia Player")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Open")
                onTriggered: {
                    mediaplayer.stop();
                    fileDialog.folder = "file:///sdcard/";
                    fileDialog.open();
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
                text: qsTr("M80RADIO")
                onTriggered: {
                    mediaplayer.stop();
                    mediaplayer.source = "http://208.92.53.75:3690/M80RADIO";
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
