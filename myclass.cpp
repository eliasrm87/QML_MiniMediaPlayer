#include "myclass.h"

void MyClass::cppSlot(const QString &msg)
{
    qDebug() << "Called the C++ slot with message:" << msg;
    emit cppSignal("Hello from C++");
}
