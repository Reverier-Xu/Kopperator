#pragma once

#include <QObject>
#include <QVariantList>

class ChatBackend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantList messages READ messages NOTIFY messagesChanged)

public:
    explicit ChatBackend(QObject *parent = nullptr);

    QVariantList messages() const;

    Q_INVOKABLE void sendMessage(const QString &text);
    Q_INVOKABLE void clear();

signals:
    void messagesChanged();

private:
    void appendMessage(const QString &author, const QString &content);

    QVariantList m_messages;
};
