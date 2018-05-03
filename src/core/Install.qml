import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.1
import QtQml 2.2
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2

import GCompris 1.0 as GCompris
import "qrc:/gcompris/src/core/core.js" as Core

Window {
    id: loginWindow
    property string usernames: login.text;
    property string passwords: password.text;


    flags: Qt.Dialog
    property string url: "qrc:/gcompris/src/activities/menu/resource/background.svg"
    modality: Qt.WindowModal
    width: 700
    height: 360
    minimumHeight: 160
    minimumWidth: 400
    title: "Login to Continue"
    Dialog {
            id: helloDialog
            modality: Qt.WindowModal
            title:  "HUBBLE INSTALLED"
            onButtonClicked: console.log("clicked button " + clickedButton)
            onAccepted: lastChosen.text = "Accepted " +
                (clickedButton == StandardButton.Ok ? "(OK)" : (clickedButton == StandardButton.Retry ? "(Retry)" : "(Ignore)"))
            onRejected: lastChosen.text = "Rejected " +
                (clickedButton == StandardButton.Close ? "(Close)" : (clickedButton == StandardButton.Abort ? "(Abort)" : "(Cancel)"))
            onHelp: lastChosen.text = "Yelped for help!"
            onYes: lastChosen.text = (clickedButton == StandardButton.Yes ? "Yeessss!!" : "Yes, now and always")
            onNo: lastChosen.text = (clickedButton == StandardButton.No ? "Oh No." : "No, no, a thousand times no!")
            onApply: lastChosen.text = "Apply"
            onReset: lastChosen.text = "Reset"

            Label {
                text: "Happy pod has been successfully installed. Restart to start using the application!"
            }
        }

    Dialog {
            id: wrong
            modality: Qt.WindowModal
            title:  "LOGIN ERROR"
            onButtonClicked: console.log("clicked button " + clickedButton)
            onAccepted: lastChosen.text = "Accepted " +
                (clickedButton == StandardButton.Ok ? "(OK)" : (clickedButton == StandardButton.Retry ? "(Retry)" : "(Ignore)"))
            onRejected: lastChosen.text = "Rejected " +
                (clickedButton == StandardButton.Close ? "(Close)" : (clickedButton == StandardButton.Abort ? "(Abort)" : "(Cancel)"))
            onHelp: lastChosen.text = "Yelped for help!"
            onYes: lastChosen.text = (clickedButton == StandardButton.Yes ? "Yeessss!!" : "Yes, now and always")
            onNo: lastChosen.text = (clickedButton == StandardButton.No ? "Oh No." : "No, no, a thousand times no!")
            onApply: lastChosen.text = "Apply"
            onReset: lastChosen.text = "Reset"

            Label {
                text: "Wrong credentials used. Please contact Hubble Innovations Ltd"
            }
        }

    GridLayout {
        columns: 2
        anchors.fill: parent
        anchors.margins: 10
        rowSpacing: 10
        columnSpacing: 10


        Label {
            text: "Login"
        }
        TextField {
            id: login
            Layout.fillWidth: true
        }

        Label {
            text: "Password"
        }
        TextField {
            id: password
            echoMode: TextInput.Password
            Layout.fillWidth: true
        }


        Item {
            Layout.columnSpan: 2
               Layout.fillWidth: true
               implicitHeight: button.height

            Button {
                anchors.centerIn: parent
                text: "Enter"
                opacity: 0.9
                id:button;
                function ispassword(username,password){
                    var creds = [username,password];
                    if ((username ==="HUBBLE") &&(password==="Happy2017")){
                        //GCompris.ApplicationSettings.setAllowed(true);
                        console.log(ApplicationSettings);
                        //Qt.quit();
                    } else {
                        wrong.open();
                        //GCompris.ApplicationSettings.setIsAllowed(false);
                    }
                    return creds;
                }
                    //alert("Wrong Credentials.")
                    //showMessageDialog(parent,"lalala","ke",null,"jje",null,null)
                onClicked: {
                      console.log(ispassword(usernames,passwords));
                    //  Core.ispassword(loginWindow,usernames,passwords);
                }
            }
        }
    }
}
