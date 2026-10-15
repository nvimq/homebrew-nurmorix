# nurmorix for Homebrew

> **Public downloads are paused.** nurmorix is proprietary software; public builds are withdrawn while the codebase is being cleaned of third-party code under incompatible licenses. The cask below will not resolve until builds are published again.

Native keyboard launcher for macOS (Apple silicon, macOS 14+): search, AI, clipboard history, window management and display control in one app. No Electron, no web view.

## Install

```sh
brew install --cask nvimq/nurmorix/nurmorix
open /Applications/nurmorix.app
```

The first launch walks you through permissions and the launcher hotkey.

## Update

nurmorix updates itself (menu bar icon → Install Update when a new build is out). `brew upgrade --cask nurmorix` works too.

## Verify a build

Every release `build-<n>` carries `nurmorix.app.zip`, its Sigstore bundle `nurmorix.app.zip.sigstore.json` and `SHA256SUMS`. The zip is signed keylessly in CI (GitHub OIDC identity of the master build workflow, logged in the public Rekor transparency log). With [cosign](https://github.com/sigstore/cosign) 3 or newer (`brew install cosign`), in a folder with the three files of a release:

```sh
shasum -a 256 -c SHA256SUMS
cosign verify-blob nurmorix.app.zip \
  --bundle nurmorix.app.zip.sigstore.json \
  --certificate-identity https://github.com/nvimq/nurmorix/.github/workflows/ci.yml@refs/heads/master \
  --certificate-oidc-issuer https://token.actions.githubusercontent.com
```

`nurmorix version` prints the installed build and the commit it was built from (`nurmorix 0.1.<n> (<short commit>)`); the in-app updater also checks the download against the release's SHA-256 before installing.

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

Проверить сборку: в каждом релизе лежат `SHA256SUMS` и подпись Sigstore `nurmorix.app.zip.sigstore.json`; команды `shasum -a 256 -c SHA256SUMS` и `cosign verify-blob …` — в разделе «Verify a build» выше. `nurmorix version` показывает версию и коммит сборки.
