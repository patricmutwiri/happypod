import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.1
import QtQml 2.2

import QtQuick.Layouts 1.0

import GCompris 1.0
import "qrc:/gcompris/src/core/core.js" as Core

Window {
    id: main
    // Start in window mode at full screen size
    width: ApplicationSettings.previousWidth
    height: ApplicationSettings.previousHeight
    minimumWidth: 400 * ApplicationInfo.ratio
    minimumHeight: 400 * ApplicationInfo.ratio
    property string url: "qrc:/gcompris/src/activities/menu/resource/background.svg"
    title: "Happypod"
    onClosing:  Qt.quit()
    GridLayout {
        columns: 2
        anchors.fill: parent
        rowSpacing: 5
        columnSpacing: 5

        Image{
            source:main.url
            anchors.fill: parent
        }

        Text {
            width:600;
            height:600;
            color: "black"
            text: "Thank you for subscribing to Happy Pod by Hubble. \nYou have now reached the end of your subscription period. \nPlease contact Hubble on: \n+254790506864,+254755660514\nor \nemail: hello@ehubble.io"
            verticalAlignment: Text.AlignVCenter
            padding: 0
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.PlainText
            font.pixelSize: 12
            font.italic: false
            anchors.centerIn: parent
        }

        Item {
            x: 0
            Layout.columnSpan: 2
            Layout.fillWidth: true

            Button {
                anchors.centerIn: parent
                text: "QUIT"
                z: 3
                Layout.fillWidth: true
                enabled: true
                anchors.verticalCenterOffset: -34
                anchors.horizontalCenterOffset: -155
                id:button;
                x: -150
                y: -124
                width: 200
                height: 33
                onClicked: {
                    Core.quit(main);
                }
            }
            //implicitHeight: button.height
        }


    }
    //property string url: "qrc:/gcompris/src/activities/menu/resource/background.svg"

    // background:main.url

    // Component.onCompleted:Core.showMessageDialog(
    //main,
    // qsTr("Thank you for subscribing to Happy Pod by Hubble . " +
    //"You have now reached the end of your Subscription period.To renew your user lincense"+
    //  ",Please contact Hubble on "+
    //      "+254790506864 or hello@ehubble.io" ),
    //qsTr("Quit"),
    //  Qt.quit(),qsTr("OK"), Qt.quit(), Qt.quit()
    //);


}
