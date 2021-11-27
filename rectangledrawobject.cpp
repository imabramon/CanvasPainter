#include "rectangledrawobject.h"

#include <QJsonObject>

RectangleDrawObject::RectangleDrawObject(): DrawObject("green", "black")
{
    m_x = 50;
    m_y = 40;
    m_width = 100;
    m_heigh = 80;
}

RectangleDrawObject::RectangleDrawObject(int x, int y,
                                         int width, int height,
                                         QString fillColor, QString borderColor):
    DrawObject(fillColor, borderColor)
{
    m_x = x;
    m_y = y;
    m_width = width;
    m_heigh = height;
}

DrawObject::Type RectangleDrawObject::getType() const
{
    return Type::Rectangle;
}

QJsonObject RectangleDrawObject::getShapeData() const
{
    QJsonObject jsonObject;
    jsonObject["x"] = m_x;
    jsonObject["y"] = m_y;
    jsonObject["width"] = m_width;
    jsonObject["height"] = m_heigh;

    return jsonObject;
}
