#ifndef TEXTDRAWOBJECT_H
#define TEXTDRAWOBJECT_H

#include "drawobject.h"
#include <QObject>

class TextDrawObject : public DrawObject
{
public:
    TextDrawObject(): DrawObject("white", "black") {};
    Type getType() const;
    QJsonObject getShapeData() const;
};

#endif // TEXTDRAWOBJECT_H
