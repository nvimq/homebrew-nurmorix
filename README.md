# nurmorix for Homebrew

Native keyboard launcher for macOS (Apple silicon, macOS 14+): search, AI, clipboard history, window management and display control in one app. No Electron, no web view.

## Install

```sh
brew install --cask nvimq/nurmorix/nurmorix
open /Applications/nurmorix.app
```

The first launch walks you through permissions and the launcher hotkey.

## Update

nurmorix updates itself (menu bar icon → Install Update when a new build is out). `brew upgrade --cask nurmorix` works too.

## Uninstall

```sh
brew uninstall --cask nurmorix          # the app
brew uninstall --cask --zap nurmorix    # the app and its settings and data
```

---

## Установка через Homebrew

Нативный лаунчер для macOS (Apple silicon, macOS 14+): поиск, ИИ, история буфера обмена, управление окнами и дисплеями в одном приложении. Без Electron и веб-вью.

```sh
brew install --cask nvimq/nurmorix/nurmorix
open /Applications/nurmorix.app
```

При первом запуске приложение проведёт через разрешения и выбор хоткея. Обновляется само (значок в строке меню → Install Update); `brew upgrade --cask nurmorix` тоже работает. Удалить: `brew uninstall --cask nurmorix`, вместе с настройками и данными — добавить `--zap`.
