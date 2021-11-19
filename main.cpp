#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "tooltype.h"
#include "drawobject.h"

#include "drawobjectmodel.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    qmlRegisterType<ToolType>("ToolType", 1, 0, "ToolType"); // Register this class as a module
    qmlRegisterType<DrawObject>("DrawObject", 1, 0, "DrawObject"); // Register this class as a module

    QQmlApplicationEngine engine;

    DrawObjectModel model(&engine);

    engine.rootContext()->setContextProperty("drawObjectModel", &model);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
