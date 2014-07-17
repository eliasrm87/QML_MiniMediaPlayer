#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QDebug>
#include "myclass.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlEngine *engine = new QQmlEngine;
    QQmlComponent component(engine, QUrl(QStringLiteral("qrc:///main.qml")));
    QObject* myobject = component.create();

    MyClass myClass;

    QObject::connect(myobject, SIGNAL(qmlSignal(QString)),
                     &myClass, SLOT(cppSlot(QString)));

    QObject::connect(&myClass, SIGNAL(cppSignal(QVariant)),
                     myobject, SLOT(qmlSlot(QVariant)));

    return app.exec();
}
