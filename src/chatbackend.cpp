#include "chatbackend.h"

#include <QTimer>
#include <QString>

ChatBackend::ChatBackend(QObject *parent)
    : QObject(parent)
{
    appendMessage(QStringLiteral("assistant"), QStringLiteral("Welcome to **Kopperator**. Ask me anything!"));
}

QVariantList ChatBackend::messages() const
{
    return m_messages;
}

void ChatBackend::sendMessage(const QString &text)
{
    const QString trimmed = text.trimmed();
    if (trimmed.isEmpty()) {
        return;
    }

    appendMessage(QStringLiteral("user"), trimmed);

    QTimer::singleShot(320, this, [this, trimmed]() {
        const QString reply = QStringLiteral("**AI:** I heard “%1”.\n\nUsing KDE's markdown renderer keeps formatting intact.").arg(trimmed.toHtmlEscaped());
        appendMessage(QStringLiteral("assistant"), reply);
    });
}

void ChatBackend::clear()
{
    m_messages.clear();
    emit messagesChanged();
}

void ChatBackend::appendMessage(const QString &author, const QString &content)
{
    QVariantMap map;
    map.insert(QStringLiteral("author"), author);
    map.insert(QStringLiteral("content"), content);
    m_messages.push_back(map);
    emit messagesChanged();
}
