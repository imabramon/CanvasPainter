import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12

import "components"

Window {
    id: root

    width: 640
    height: 480
    visible: true
    title: qsTr("Canvas Painter")

    ListModel{
        id: toolsModel

        ListElement{
            icon: "images/pen.png"
        }

        ListElement{
            icon: "images/rectangle.png"
        }

        ListElement{
            icon: "images/ellipse.png"
        }

        ListElement{
            icon: "images/text-option.png"
        }
    }

    Component{
        id: toolItemDelegate

        ToolItem{
            icon: model.icon
        }
    }

    Rectangle{

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        border.color: "black"
        border.width: 2

        width: toolsRow.width
        height: toolsRow.height

        Row{
            id: toolsRow

            spacing: 5

            padding: 5

            Repeater{
                model: toolsModel
                delegate: toolItemDelegate
            }
        }

    }


}
