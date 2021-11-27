#include "rectangledrawobject.h"

#include <QJsonObject>

DrawObject::Type RectangleDrawObject::getType() const
{
    return Type::Rectangle;
}

QJsonObject RectangleDrawObject::getShapeData() const
{
    QJsonObject jsonObject;
    jsonObject["x"] = 50;
    jsonObject["y"] = 40;
    jsonObject["width"] = 100;
    jsonObject["height"] = 80;

    return jsonObject;
}
