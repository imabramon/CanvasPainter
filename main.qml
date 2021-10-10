import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12

import "components"
import toolType 1.0

Window {
    id: root

    width: 640
    height: 480
    visible: true
    title: qsTr("Canvas Painter")

    ListModel{
        id: toolsModel

        function chooseTool(type){
            var lenght = toolsModel.count;
            for(var i = 0; i < lenght; i++){
                if(i === type){
                    toolsModel.get(i).isChoosen = true;
                }else{
                    toolsModel.get(i).isChoosen = false;
                }
            }
        }

        ListElement{
            icon: "images/pen.png"
            isChoosen: true
            toolType: ToolType.Pen
        }

        ListElement{
            icon: "images/rectangle.png"
            isChoosen: false
            toolType: ToolType.Rectangle
        }

        ListElement{
            icon: "images/ellipse.png"
            isChoosen: false
             toolType: ToolType.Ellipse
        }

        ListElement{
            icon: "images/text-option.png"
            isChoosen: false
             toolType: ToolType.Text
        }
    }

    Component{
        id: toolItemDelegate

        ToolItem{
            id: item

            icon: model.icon
            isChoosen: model.isChoosen
            type: model.toolType

            Component.onCompleted: {
                item.choose.connect(toolsModel.chooseTool);
            }
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
