#include "circledrawobject.h"

#include <QJsonObject>

DrawObject::Type CircleDrawObject::getType() const
{
    return Type::Circle;
}

QJsonObject CircleDrawObject::getShapeData() const
{
    QJsonObject jsonObject;
    jsonObject["x"] = 100;
    jsonObject["y"] = 250;
    jsonObject["radius"] = 50;
    return jsonObject;
}
