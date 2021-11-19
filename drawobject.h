#ifndef DRAWOBJECT_H
#define DRAWOBJECT_H

#include <QObject>
#include <QColor>
#include <QJsonObject>

class DrawObject: public QObject
{
    Q_OBJECT
public:
    DrawObject(QString fillColor = "black", QString borderColor = "black");

    enum Type{
        NonType,
        Rectangle,
        Circle,
        Text,
        Shape
    };

    Q_ENUM(Type)

    QColor getFillColor() const;
    QColor getBorderColor() const;

    virtual Type getType() const {return Type::NonType;}
    virtual QJsonObject getShapeData() const {return QJsonObject();}
private:
    QColor m_fillColor;
    QColor m_borderColor;
};

#endif // DRAWOBJECT_H
