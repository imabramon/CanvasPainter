import QtQuick 2.0
import QtQuick.Controls 2.15

Popup {
    id: root
    x: Math.round((parent.width - width) / 2)
    y: - parent.height - height
    width: 200
    height: 300
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    Rectangle{
        anchors.fill: parent
        color: "black"
        Text{
            anchors.centerIn: parent
            text: "Color Picker"
        }
    }
}
