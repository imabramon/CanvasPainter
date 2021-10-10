import QtQuick 2.15

Item {
    id: root

    property string icon
    property bool isChoosen: false
    property int type

    signal choose(int type)

    width: wrap.width
    height: wrap.height

    Rectangle{
        id: wrap

        property int size: 30

        width: size
        height: size

        Rectangle{
            id: content

            property int size: 20

            anchors.centerIn: parent

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

            TapHandler{
                onTapped: {
                    //root.isChoosen = true;
                    root.choose(root.type);
                }
            }

            states: [
                State {
                    name: "choosen"
                    when: root.isChoosen
                    PropertyChanges {
                        target: content
                        size: 30
                    }
                }
            ]
        }
    }
}
