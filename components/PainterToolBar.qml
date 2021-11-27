import QtQuick 2.15

import ToolType 1.0

Item {
    id: root

    width: toolBar.width
    height: toolBar.height

    property alias tool: toolBar.currentToolType
    property alias fill: toolBar.currentFillColor
    property alias border: toolBar.currentBorderColor

    ListModel{
        id: toolsModel

        function chooseTool(type){
            toolBar.currentToolType = type
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
        id: toolBar

        property int currentToolType: ToolType.Pen
        property alias currentFillColor: fillColorPicker.color
        property alias currentBorderColor: borderColorPicker.color

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

            Rectangle{
                id: fillColorPickerWraper

                width: 30
                height: 30

                Rectangle{
                    id: fillColorPicker

                    width: 20
                    height: 20

                    radius: 10

                    border{
                        width: 1
                        color: "black"
                    }

                    anchors.centerIn: parent

                    color: fillColorPickerPopUp.choosenColor

                    TapHandler{
                        onTapped: {
                            fillColorPickerPopUp.open()
                        }
                    }

                    ColorPicker{
                        choosenColor: "green"
                        id: fillColorPickerPopUp
                    }
                }
            }

            Rectangle{
                id: borderColorPickerWraper

                width: 30
                height: 30

                Rectangle{
                    id: borderColorPicker

                    width: 20
                    height: 20

                    radius: 10

                    anchors.centerIn: parent

                    border.color: "black"
                    border.width: 1

                    color: borderColorPickerPopUp.choosenColor

                    Rectangle{
                        width: 10
                        height: 10

                        anchors.centerIn: parent
                        radius: 5

                        color: "white"
                        border.color: "black"
                        border.width: 1
                    }

                    TapHandler{
                        onTapped: {
                           borderColorPickerPopUp.open();
                        }
                    }

                    ColorPicker{
                        choosenColor: "black"
                        id: borderColorPickerPopUp
                    }
                }
            }
        }

    }

}
