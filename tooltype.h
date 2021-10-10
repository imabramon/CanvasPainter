#ifndef TOOLTYPE_H
#define TOOLTYPE_H

#include <QObject>

class ToolType: public QObject
{
    Q_OBJECT
public:
    enum State{
        Pen,
        Rectangle,
        Ellipse,
        Text
    };

    Q_ENUM(State)
};

#endif // TOOLTYPE_H
