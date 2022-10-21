import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.0
import "components"



Window {
    id: principal
    width: 1400
    height: 780
    visible: true
    color: "#1f2128"
    title: qsTr("Acceso")

    //Custom Properties
    property string username
    property int windowMargin: 10

    //REMOVE TITLE BAR
    flags: Qt.SplashScreen | Qt.FramelessWindowHint

    // Propeties
    property int windowStatus: 0

    Rectangle {
        id: rectangle_Ls
        width: 300
        visible: true
        color: "#1f2128"
        radius: 15
        border.color: "#00000000"
        anchors.left: parent.left
        anchors.top: lblOnLine.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 30
        anchors.bottomMargin: 30
        anchors.topMargin: 30
        layer.enabled: true
        layer.effect: DropShadow {
            color: "#e6282b34"
            radius: 3
            spread: 0
            transparentBorder: true
            horizontalOffset: -3
            verticalOffset: -3
        }
    }

    Rectangle {
        id: rectangle_Bs
        width: 300
        visible: true
        color: "#1f2128"
        radius: 15
        border.color: "#00000000"
        anchors.left: parent.left
        anchors.top: lblOnLine.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 30
        anchors.bottomMargin: 30
        anchors.topMargin: 30
        layer.enabled: true
        layer.effect: DropShadow {
            color: "#ed121216"
            radius: 3
            spread: 0
            transparentBorder: true
            horizontalOffset: 3
            verticalOffset: 3
        }
    }



    Image {
        id: image
        width: 207
        height: 35
        anchors.left: parent.left
        anchors.top: parent.top
        source: "../images/SD_GP2_H.png"
        anchors.leftMargin: 5
        anchors.topMargin: 5
        fillMode: Image.PreserveAspectFit

        DragHandler {
            onActiveChanged: if(active){
                                 mainWindow.startSystemMove()
                                 internal.ifMaximizedWindowRestore()
                             }
        }
    }

    QtObject{
        id: internal

        function maximizeRestore(){
            if(windowStatus == 0){
                principal.showMaximized()
                windowStatus = 1
                windowMargin = 0
                // Resize visibility
                //resizeLeft.visible = false
                //resizeRight.visible = false
                //resizeBottom.visible = false
                //resizeWindow.visible = false
                btnMaximizeRestore.btnIconSource = "../images/png_icons_wanderson/restore_icon.png"
            }
            else{
                principal.showNormal()
                windowStatus = 0
                windowMargin = 10
                // Resize visibility
                //internal.resetResizeBorders()
                btnMaximizeRestore.btnIconSource = "../images/png_icons_wanderson/maximize_icon.png"
            }
        }

        function ifMaximizedWindowRestore(){
            if(windowStatus == 1){
                principal.showNormal()
                windowStatus = 0
                windowMargin = 10
                // Resize visibility
                //internal.resetResizeBorders()
                btnMaximizeRestore.btnIconSource = "../images/png_icons_wanderson/maximize_icon.png"
            }
        }
    }


    Label {
        id: lblOnLine
        width: 110
        height: 15
        opacity: 1
        color: "#ac5cff"
        text: qsTr("Asesores en línea")
        anchors.left: parent.left
        anchors.top: lblCorpData2.bottom
        font.letterSpacing: 0
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 30
        anchors.topMargin: 6
        font.styleName: "Light"
        font.kerning: true
        topPadding: 0
        bottomInset: 1
        rightInset: 1
        font.wordSpacing: 0
        styleColor: "#000000"
        leftInset: 1
        topInset: 1
        font.preferShaping: true
        font.pointSize: 10
        font.family: "Segoe UI"
        z: 1
    }


    DropShadow{
        id: dponline
        anchors.fill: lblOnLine
        source: lblOnLine
        verticalOffset: 0
        horizontalOffset: 0
        color: "#af7ae3"
        radius: 3
        z: 0
    }

    Label {
        id: lblWelcome
        width: 416
        height: 22
        opacity: 1
        color: "#dcdcdc"
        text: qsTr("Bienvenido, " + username)
        anchors.left: parent.left
        anchors.top: image.bottom
        anchors.bottom: textUsername.top
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        anchors.bottomMargin: 15
        anchors.topMargin: 10
        z: 1
        anchors.leftMargin: 30
        font.family: "Segoe UI"
    }
    Label {
        id: lblCorpData2
        width: 300
        height: 18
        opacity: 1
        color: "#dcdcdc"
        text: qsTr("Seleccione el numero de descansos disponibles")
        anchors.left: parent.left
        anchors.top: lblWelcome.bottom
        anchors.bottom: textUsername.top
        font.pixelSize: 14
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 30
        anchors.topMargin: 6
        anchors.bottomMargin: 15
        font.family: "Segoe UI"
        z: 1
    }
    MaximizeButton {
        id: btnMaximizeRestore
        x: 1293
        width: 35
        height: 30
        visible: true
        anchors.right: closeButton.left
        anchors.top: parent.top
        anchors.topMargin: 2
        anchors.rightMargin: 1
        btnColorClicked: "#4e4e5f"
        btnColorDefault: "#373743"
        btnColorMouseOver: "#09090b"
        onClicked: internal.maximizeRestore()
    }
    MinimizeButton {
        id: minimizeButton
        x: 1266
        width: 35
        height: 30
        visible: true
        anchors.right: btnMaximizeRestore.left
        anchors.top: parent.top
        anchors.topMargin: 2
        btnColorClicked: "#4e4e5f"
        btnColorMouseOver: "#09090b"
        btnColorDefault: "#373743"
        anchors.rightMargin: 1
        onClicked: principal.showMinimized()
    }
    CloseButton {
        id: closeButton
        x: 1325
        width: 35
        height: 30
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 2
        anchors.rightMargin: 2
        btnColorMouseOver: "#09090b"
        btnColorDefault: "#373743"
        btnColorClicked: "#4e4e5f"
        onClicked: principal.close()
    }
    DropShadow {
        anchors.fill: lblCorpData2
        source: lblCorpData2
        verticalOffset: 0
        horizontalOffset: 0
        radius: 2
        color: "#190033"
        z: 0
    }

    Rectangle {
        id: rectangle_Ls1
        visible: true
        color: "#1f2128"
        radius: 15
        border.color: "#00000000"
        anchors.left: rectangle_Ls.right
        anchors.right: parent.right
        anchors.top: lblOnLine.bottom
        anchors.bottom: parent.bottom
        anchors.rightMargin: 30
        anchors.topMargin: 30
        layer.enabled: true
        anchors.bottomMargin: 30
        layer.effect: DropShadow {
            color: "#e6282b34"
            radius: 3
            verticalOffset: -3
            spread: 0
            transparentBorder: true
            horizontalOffset: -3
        }
        anchors.leftMargin: 30
    }

    Rectangle {
        id: rectangle_Bs1
        visible: true
        color: "#1f2128"
        radius: 15
        border.color: "#00000000"
        anchors.left: rectangle_Bs.right
        anchors.right: parent.right
        anchors.top: lblOnLine.bottom
        anchors.bottom: parent.bottom
        anchors.rightMargin: 30
        anchors.topMargin: 30
        layer.enabled: true
        anchors.bottomMargin: 30
        layer.effect: DropShadow {
            color: "#ed121216"
            radius: 3
            verticalOffset: 3
            spread: 0
            transparentBorder: true
            horizontalOffset: 3
        }
        anchors.leftMargin: 30
    }



}
/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:18}
}
##^##*/
