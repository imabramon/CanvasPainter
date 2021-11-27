#include "shapedrawobject.h"

#include <QJsonObject>
#include <QJsonArray>

DrawObject::Type ShapeDrawObject::getType() const
{
    return Type::Shape;
}

QJsonObject ShapeDrawObject::getShapeData() const
{
    QJsonObject jsonObject, point1, point2, point3;
    QJsonArray jsonArray;

    point1["x"] = 300;
    point1["y"] = 300;
    point2["x"] = 300;
    point2["y"] = 600;
    point3["x"] = 450;
    point3["y"] = 450;

    jsonArray.push_back(point1);
    jsonArray.push_back(point2);
    jsonArray.push_back(point3);

    jsonObject["points"] = jsonArray;

    return jsonObject;
}
