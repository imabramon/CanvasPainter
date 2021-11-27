#ifndef RECTANGLEDRAWOBJECT_H
#define RECTANGLEDRAWOBJECT_H

#include "drawobject.h"
#include <QObject>

class RectangleDrawObject : public DrawObject
{
public:
    RectangleDrawObject();
    RectangleDrawObject(int x, int y, int width, int height, QString fillColor, QString borderColor);
    Type getType() const;
    QJsonObject getShapeData() const ;
private:
    int m_x;
    int m_y;
    int m_width;
    int m_heigh;
};

#endif // RECTANGLEDRAWOBJECT_H
