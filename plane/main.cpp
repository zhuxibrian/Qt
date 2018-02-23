#include <Qt3DQuickExtras/qt3dquickwindow.h>
#include <QGuiApplication>
#include <QQuickView>
#include <QQmlContext>

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);
//    Qt3DExtras::Quick::Qt3DQuickWindow view;
//    view.resize(1600, 800);
//    view.setSource(QUrl("qrc:/PlaneSource.qml"));
//    view.show();

    QQuickView view;
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl("qrc:/main.qml"));
    view.setColor("#000000");
    view.show();

    return app.exec();
}
