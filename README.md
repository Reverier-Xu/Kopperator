# Kopperator
KDE Plasma 6 plasmoid that surfaces an AI chat experience. Messages are rendered with KDE's Markdown renderer so bold, lists and code snippets are preserved.

## Building and installing

```bash
cmake -B build -S . -DCMAKE_INSTALL_PREFIX=$(kf6-config --prefix)
cmake --build build
cmake --install build
```

To install or update the plasmoid package manually during development:

```bash
kpackagetool6 -t Plasma/Applet -i package || kpackagetool6 -t Plasma/Applet -u package
```

After installation, add **Kopperator** from the Plasma widget picker. Use the text area to send a prompt; the built-in mock AI echoes your message, showing the Markdown rendering pipeline in action.
