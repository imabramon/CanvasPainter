#include "drawobjectmodel.h"

#include "rectangledrawobject.h"
#include "circledrawobject.h"
#include "textdrawobject.h"
#include "shapedrawobject.h"

#include <QJsonObject>

DrawObjectModel::DrawObjectModel(QObject *parent): QAbstractListModel(parent), m_list()
{
    m_list.append(new RectangleDrawObject());
    m_list.append(new CircleDrawObject());
    m_list.append(new ShapeDrawObject());
    m_list.append(new TextDrawObject());


}

DrawObjectModel::~DrawObjectModel()
{
    for(auto i = m_list.begin(); i != m_list.end(); i++){
        if(*i != nullptr){
            delete *i;
        }
    }
}

int DrawObjectModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_list.size();
}

QVariant DrawObjectModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid()){
        return QVariant();
    }

    int intIndex = index.row();

    switch(role){
    case TypeRole:{
        return QVariant(m_list[intIndex]->getType());
    }
    case FillColorRole:{
        return QVariant(m_list[intIndex]->getFillColor());
    }
    case BorderColorRole:{
        return QVariant(m_list[intIndex]->getBorderColor());
    }
    case ShapeDataRole:{

        return QVariant(m_list[intIndex]->getShapeData());
    }
    default:{
        return QVariant();
    }
    }
}

QHash<int, QByteArray> DrawObjectModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[TypeRole] = "type";
    roles[FillColorRole] = "fillColor";
    roles[BorderColorRole] = "borderColor";
    roles[ShapeDataRole] = "shapeData";

    return roles;
}

QJsonObject DrawObjectModel::get(int i) const
{
    QJsonObject jsonObject;
    jsonObject["type"] = m_list[i]->getType();
    jsonObject["fillColor"] = m_list[i]->getFillColor();
    jsonObject["borderColor"] = m_list[i]->getBorderColor();
    jsonObject["shapeData"] = m_list[i]->getShapeData();
    return jsonObject;
}
