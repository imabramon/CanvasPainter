#ifndef DRAWOBJECTMODEL_H
#define DRAWOBJECTMODEL_H

#include <QAbstractListModel>
#include <QObject>

#include "drawobject.h"

class DrawObjectModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit DrawObjectModel(QObject * parent = nullptr);
    ~DrawObjectModel();

    enum Roles{
        TypeRole = Qt::UserRole + 1,
        FillColorRole,
        BorderColorRole,
        ShapeDataRole
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE QJsonObject get(int i) const;
    Q_INVOKABLE int count() const {return m_list.size();}
    Q_INVOKABLE void addRectangle(int x, int y, int width, int height, QString fillColor, QString borderColor);
private:
    QList<DrawObject *> m_list;
};

#endif // DRAWOBJECTMODEL_H
