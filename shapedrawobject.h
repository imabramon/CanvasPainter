#ifndef SHAPEDRAWOBJECT_H
#define SHAPEDRAWOBJECT_H

#include "drawobject.h"
#include <QObject>

class ShapeDrawObject : public DrawObject
{
public:
    ShapeDrawObject(): DrawObject("orange", "gray") {};
    Type getType() const;
    QJsonObject getShapeData() const ;
};

#endif // SHAPEDRAWOBJECT_H
