#include <QQmlExtensionPlugin>
#include <qqml.h>

#include "chatbackend.h"

class KopperatorPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri) override
    {
        qmlRegisterType<ChatBackend>(uri, 1, 0, "ChatBackend");
    }
};

#include "plugin.moc"
