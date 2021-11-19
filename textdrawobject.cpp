#include "textdrawobject.h"

#include <QJsonObject>

DrawObject::Type TextDrawObject::getType() const
{
    return Type::Text;
}

QJsonObject TextDrawObject::getShapeData() const
{
    QJsonObject jsonObject;
    jsonObject["x"] = 100;
    jsonObject["y"] = 250;
    jsonObject["text"] = "Some Text";

    return jsonObject;
}
