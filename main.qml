import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.3

import "components"
import ToolType 1.0

Window {
    id: root

    width: 640
    height: 480
    visible: true
    title: qsTr("Canvas Painter")

    CustomCanvas{
        id: canvas

        anchors.fill: parent
    }

    PainterToolBar{
        id: toolBar

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

}
