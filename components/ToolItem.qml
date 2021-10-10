import QtQuick 2.0

Item {
    id: root

    property string icon

    width: content.width
    height: content.height

    Rectangle{
        id: content

        property int size: 30

        width: size
        height: size

        border.color: "black"
        border.width: 2

        radius: size / 6

        Image {
            id: image

            anchors.centerIn: parent

            width: content.size - 10
            height: content.size - 10

            source: Qt.resolvedUrl("../" + root.icon)
        }
    }
}
