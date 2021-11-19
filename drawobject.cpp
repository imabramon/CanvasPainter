#include "drawobject.h"

DrawObject::DrawObject(QString fillColor, QString borderColor)
{
    m_fillColor = QColor(fillColor);
    m_borderColor = QColor(borderColor);
}

QColor DrawObject::getFillColor() const
{
    return m_fillColor;
}

QColor DrawObject::getBorderColor() const
{
    return m_borderColor;
}
