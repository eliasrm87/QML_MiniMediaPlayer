#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>
#include <QDebug>

class MyClass : public QObject
{
    Q_OBJECT
public slots:
    void cppSlot(const QString &msg);

signals:
    void cppSignal(const QVariant &msg);
};

#endif // MYCLASS_H
