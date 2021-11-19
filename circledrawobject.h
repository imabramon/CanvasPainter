#ifndef CIRCLEDRAWOBJECT_H
#define CIRCLEDRAWOBJECT_H

#include "drawobject.h"
#include <QObject>

class CircleDrawObject : public DrawObject
{
public:
    CircleDrawObject(): DrawObject("red", "yellow") {};
    Type getType() const;
    QJsonObject getShapeData() const;
};

#endif // CIRCLEDRAWOBJECT_H
