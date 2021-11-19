#ifndef RECTANGLEDRAWOBJECT_H
#define RECTANGLEDRAWOBJECT_H

#include "drawobject.h"
#include <QObject>

class RectangleDrawObject : public DrawObject
{
public:
    RectangleDrawObject(): DrawObject("green", "black"){};
    Type getType() const;
    QJsonObject getShapeData() const ;
};

#endif // RECTANGLEDRAWOBJECT_H
