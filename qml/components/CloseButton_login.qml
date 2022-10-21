import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: button

    // Custom Properties
    property color colorDefault: "#4891d9"
    property color colorMouseOver: "#55AAFF"
    property color colorPressed: "#3F7EBD"
    width: 30
    height: 30
    text: "Button"
    display: AbstractButton.IconOnly

    QtObject{
        id: internal

        property var dynamicColor: if(button.down){
                                       button.down ? colorPressed : colorDefault
                                   }else{
                                       button.hovered ? colorMouseOver : colorDefault
                                   }
    }

    Image {
        id: image
        x: 0
        y: 0
        width: 20
        height: 20
        anchors.verticalCenter: parent.verticalCenter
        source: "../../images/svg_icons/png_icons_wanderson/close_icon.png"
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
    }

    contentItem: Item{
    }

    background: Rectangle{
        color: internal.dynamicColor
        radius: 5

    }
}
/*##^##
Designer {
    D{i:0;formeditorZoom:16}
}
##^##*/
