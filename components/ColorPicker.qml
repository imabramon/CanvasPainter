import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
    id: root

    property color choosenColor

    x: Math.round((parent.width - width) / 2)
    y: - parent.height - height
    //width: 200
    contentWidth: content.width
    //height: 200 + header.height
    contentHeight: content.height
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent


    Column{
        id: content

        // anchors.fill: parent

        Rectangle{
            id: header

            height: 20
            width: 200



            color: "lightgray"

            Text{
                anchors.centerIn: parent
                text: "Color Picker"
                font.bold: true
            }
        }

        GridView{
            id: gridView



            width: 200
            height: cellHeight * (Math.round(count / 10) + ((count % 10 > 0) ? 1 : 0))

            cellHeight: 20
            cellWidth: 20

            model: ["red",  "green", "blue", "white", "black", "aliceblue", "aqua", "blanchedalmond",
                "chartreuse", "blueviolet", "chocolate"]
            delegate: Rectangle{
                width: 20
                height: 20
                color: modelData
                border{
                    color: "black"
                    width: 1
                }

                TapHandler{
                    onTapped: {
                        root.choosenColor = modelData;
                        root.close();
                    }
                }
            }

            Component.onCompleted: {
                console.log(height);
                console.log(Math.round(count / 10));
                console.log((count % 10 > 0) ? 1 : 0);
            }
        }

    }
}
