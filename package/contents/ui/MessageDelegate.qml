import QtQuick 6.5
import QtQuick.Layouts 1.15
import org.kde.kirigami 2.20 as Kirigami
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.kirigamiaddons.markdown 1.0 as Markdown

Item {
    id: delegateRoot
    width: ListView.view ? ListView.view.width : implicitWidth
    implicitHeight: bubble.implicitHeight + Kirigami.Units.smallSpacing * 2

    property string author
    property string content

    RowLayout {
        anchors {
            fill: parent
            leftMargin: Kirigami.Units.smallSpacing
            rightMargin: Kirigami.Units.smallSpacing
            topMargin: Kirigami.Units.smallSpacing
            bottomMargin: Kirigami.Units.smallSpacing
        }
        spacing: Kirigami.Units.smallSpacing
        layoutDirection: author === "user" ? Qt.RightToLeft : Qt.LeftToRight

        PlasmaComponents3.Label {
            visible: author === "assistant"
            text: i18n("AI")
            font.weight: Font.DemiBold
            opacity: 0.7
        }

        Rectangle {
            id: bubble
            Layout.fillWidth: true
            radius: Kirigami.Units.smallSpacing
            color: author === "user" ? Kirigami.Theme.highlightColor : Kirigami.Theme.backgroundColor
            border.color: Kirigami.Theme.alternateBackgroundColor
            border.width: 1
            implicitHeight: mdLabel.implicitHeight + Kirigami.Units.smallSpacing * 2

            Markdown.Label {
                id: mdLabel
                anchors {
                    fill: parent
                    margins: Kirigami.Units.smallSpacing
                }
                text: content
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                color: author === "user" ? Kirigami.Theme.highlightedTextColor : Kirigami.Theme.textColor
            }
        }

        PlasmaComponents3.Label {
            visible: author === "user"
            text: i18n("You")
            font.weight: Font.DemiBold
            opacity: 0.7
        }
    }
}
