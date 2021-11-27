#include "drawobject.h"

DrawObject::DrawObject(QString fillColor, QString borderColor)
{
    m_fillColor = fillColor;
    m_borderColor = borderColor;
}

QString DrawObject::getFillColor() const
{
    return m_fillColor;
}

QString DrawObject::getBorderColor() const
{
    return m_borderColor;
}
