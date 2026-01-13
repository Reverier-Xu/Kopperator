import QtQuick 6.5
import QtQuick.Layouts 1.15
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.kirigami 2.20 as Kirigami
import org.reverier.kopperator 1.0 as Kopperator

PlasmoidItem {
    id: root
    width: Kirigami.Units.gridUnit * 24
    height: Kirigami.Units.gridUnit * 20

    readonly property bool compact: width < Kirigami.Units.gridUnit * 18

    layout: GridLayout {
        anchors.fill: parent
        rowSpacing: Kirigami.Units.smallSpacing
        columnSpacing: Kirigami.Units.smallSpacing
        columns: 1
        rows: 2

        ListView {
            id: messageView
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: Kirigami.Units.smallSpacing
            model: backend.messages
            delegate: MessageDelegate {
                author: modelData.author
                content: modelData.content
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: Kirigami.Units.smallSpacing

            PlasmaComponents3.TextArea {
                id: inputField
                Layout.fillWidth: true
                placeholderText: i18n("Type a message with **markdown**…")
                wrapMode: TextEdit.Wrap
                onAccepted: sendMessage()
                Keys.onReturnPressed: {
                    if (event.modifiers & Qt.ShiftModifier) {
                        inputField.insert(inputField.cursorPosition, "\n")
                    } else {
                        sendMessage()
                    }
                }
            }

            PlasmaComponents3.Button {
                text: i18n("Send")
                icon.name: "document-send"
                onClicked: sendMessage()
                enabled: inputField.text.trim().length > 0
            }
        }
    }

    readonly property Kopperator.ChatBackend backend: Kopperator.ChatBackend {}

    function sendMessage() {
        backend.sendMessage(inputField.text)
        inputField.text = ""
        messageView.positionViewAtEnd()
    }
}
