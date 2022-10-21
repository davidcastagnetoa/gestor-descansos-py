import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "components"
import QtGraphicalEffects 1.0
import QtQuick.Timeline 1.0


Window {
    id: loginPage
    width: 380
    height: 580
    visible: true
    color: "#00000000"
    title: qsTr("Acceso")

    //REMOVE TITLE BAR
    flags: Qt.SplashScreen | Qt.FramelessWindowHint

    // Internal Functions

    QtObject {
        id: internal

        function checkLogin(username, password){
            if(username === "davidcastagnetoa" && password === "1234"){
                var component = Qt.createComponent("principal.qml")
                var win = component.createObject()
                win.username = username
                win.show()
                visible = false
            }
        }
    }

    Rectangle {
        id: background
        x: 90
        y: 190
        width: 360
        height: 560
        opacity: 1
        color: "#190033"
        radius: 9.9
        border.color: "#00000000"
        border.width: 1
        anchors.verticalCenter: parent.verticalCenter
        z: 1
        antialiasing: true
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#190033"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }
        }
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter

        DragHandler{
            onActiveChanged: if(active){
                                 loginPage.startSystemMove()
                             }
        }



        CloseButton_login {
            id: closeButton_login
            x: 315
            y: 15
            opacity: 0
            text: "Button"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 15
            anchors.topMargin: 15
            colorPressed: "#983fbd"
            colorMouseOver: "#aa55ff"
            colorDefault: "#b648d9"
            onClicked: loginPage.close()
        }

        Image {
            id: logoGPSDImage
            x: 17
            y: 65
            width: 326
            height: 135
            opacity: 1
            anchors.top: parent.top
            source: "../images/V_SD_GPB.png"
            anchors.topMargin: 65
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
        }

        CircularProgressBar {
            id: circularProgressBar
            x: 55
            y: 236
            opacity: 1
            visible: true
            text: "% Cargando"
            anchors.verticalCenter: parent.verticalCenter
            enabled: false
            z: 0
            textSize: 18
            value: 100
            enableDropShadow: true
            baselineOffset: 0
            focus: false
            antialiasing: false
            clip: false
            maxValue: 100
            strokeBgWidth: 8
            progressWidth: 12
            samples: 55
            dropShadowRadius: 8
            bgStrokeColor: "#737373"
            textColor: "#a36aff"
            progressColor: "#a36aff"
            anchors.horizontalCenter: parent.horizontalCenter
        }


        Label {
            id: lblSignIn
            x: 113
            y: 297
            width: 133
            height: 25
            opacity: 1
            color: "#dcdcdc"
            text: qsTr("Inicia Sesión")
            anchors.bottom: lblCorpData.top
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Segoe UI"
            font.pointSize: 18
        }

        Label {
            id: lblCorpData
            x: 30
            y: 330
            width: 300
            height: 18
            opacity: 1
            color: "#dcdcdc"
            text: qsTr("Accede con tus datos de acceso corporativos")
            anchors.bottom: textUsername.top
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 15
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Segoe UI"
        }

        CustomTextField {
            id: textUsername
            x: 43
            y: 343
            opacity: 0
            anchors.bottom: textPassword.top
            font.family: "Segoe UI"
            font.pointSize: 9
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 8
            placeholderText: "Tu correo corporativo"
        }

        CustomTextField {
            id: textPassword
            x: 30
            y: 389
            opacity: 1
            anchors.bottom: btnLogin.top
            font.family: "Segoe UI"
            font.pointSize: 9
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 13
            placeholderText: "Tu contraseña"
            echoMode: TextInput.Password
        }

        CustomButton {
            id: btnLogin
            x: 172
            y: 435
            width: 300
            height: 40
            opacity: 1.1
            text: "Acceder"
            anchors.bottom: parent.bottom
            font.pointSize: 10
            anchors.bottomMargin: 60
            colorDefault: "#b648d9"
            colorPressed: "#983fbd"
            colorMouseOver: "#aa55ff"
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: internal.checkLogin(textUsername.text, textPassword.text)
        }



        Label {
            id: lblDevelopTeam
            width: 110
            opacity: 1
            color: "#dcdcdc"
            text: qsTr("Desarrollo Front-Line")
            anchors.left: parent.left
            anchors.top: btnLogin.bottom
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 10
            anchors.bottomMargin: 35
            anchors.leftMargin: 30
            font.family: "Segoe UI"
            font.pointSize: 8
        }

        Label {
            id: lblDevelopTeam1
            width: 179
            opacity: 0
            color: "#dcdcdc"
            text: qsTr("Pozuelo de Alarcon - Madrid - 2021")
            anchors.left: parent.left
            anchors.top: lblDevelopTeam.bottom
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 0
            anchors.leftMargin: 30
            anchors.bottomMargin: 19
            font.family: "Segoe UI"
            font.pointSize: 8
        }






    }

    DropShadow {
        visible: true
        anchors.fill: background
        source: background
        verticalOffset: 0
        horizontalOffset: 0
        radius: 6
        color: "#7d00fb"
        z: 0
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                running: true
                loops: 1
                duration: 4000
                to: 4000
                from: 0
            }
        ]
        enabled: true
        startFrame: 0
        endFrame: 3500

        KeyframeGroup {
            target: circularProgressBar
            property: "value"
            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 1720
                value: 100
            }
        }

        KeyframeGroup {
            target: circularProgressBar
            property: "opacity"
            Keyframe {
                frame: 1720
                value: 1
            }

            Keyframe {
                frame: 2468
                value: 0
            }

            Keyframe {
                frame: 0
                value: 1
            }
        }

        KeyframeGroup {
            target: logoGPSDImage
            property: "opacity"
            Keyframe {
                frame: 2200
                value: 0
            }

            Keyframe {
                frame: 2701
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: lblSignIn
            property: "opacity"
            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 2304
                value: 0
            }

            Keyframe {
                frame: 2805
                value: 1
            }
        }

        KeyframeGroup {
            target: lblCorpData
            property: "opacity"
            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 2403
                value: 0
            }

            Keyframe {
                frame: 2904
                value: 1
            }
        }

        KeyframeGroup {
            target: textUsername
            property: "opacity"
            Keyframe {
                frame: 3008
                value: 1
            }

            Keyframe {
                frame: 2508
                value: 0
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: textPassword
            property: "opacity"
            Keyframe {
                frame: 2607
                value: 0
            }

            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 3107
                value: 1
            }
        }

        KeyframeGroup {
            target: btnLogin
            property: "opacity"
            Keyframe {
                frame: 2706
                value: 0
            }

            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 3205
                value: 1
            }
        }

        KeyframeGroup {
            target: lblDevelopTeam
            property: "opacity"
            Keyframe {
                frame: 2805
                value: 0
            }

            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 3305
                value: 1
            }
        }

        KeyframeGroup {
            target: lblDevelopTeam1
            property: "opacity"
            Keyframe {
                frame: 3404
                value: 1
            }

            Keyframe {
                frame: 2904
                value: 0
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: background
            property: "border.width"
            Keyframe {
                frame: 0
                value: 13
            }

            Keyframe {
                frame: 1501
                value: 13
            }

            Keyframe {
                frame: 1700
                value: 1
            }
        }

        KeyframeGroup {
            target: background
            property: "radius"
            Keyframe {
                frame: 0
                value: 125
            }

            Keyframe {
                frame: 1501
                value: 125
            }

            Keyframe {
                frame: 1700
                value: 10
            }
        }

        KeyframeGroup {
            target: background
            property: "width"
            Keyframe {
                frame: 0
                value: 250
            }

            Keyframe {
                frame: 1501
                value: 250
            }

            Keyframe {
                easing.bezierCurve: [0.891,0.00372,0.107,0.999,1,1]
                frame: 2101
                value: 360
            }
        }

        KeyframeGroup {
            target: background
            property: "height"
            Keyframe {
                frame: 0
                value: 250
            }

            Keyframe {
                frame: 1501
                value: 250
            }

            Keyframe {
                easing.bezierCurve: [0.89,0.00372,0.11,0.999,1,1]
                frame: 2101
                value: 560
            }
        }

        KeyframeGroup {
            target: closeButton_login
            property: "opacity"
            Keyframe {
                frame: 2600
                value: 1
            }

            Keyframe {
                frame: 2100
                value: 0
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }
    }



}






