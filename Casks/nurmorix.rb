cask "nurmorix" do
  version "0.1.331"
  sha256 "67a66b90eb72a6f81d1bf0c5a8e87ac502c8aab1d01b4d4dd5e24cf2c4da05c0"

  url "https://github.com/nvimq/homebrew-nurmorix/releases/download/build-#{version.patch}/nurmorix.app.zip"
  name "nurmorix"
  desc "Native keyboard launcher, window manager and display control"
  homepage "https://github.com/nvimq/homebrew-nurmorix"

  livecheck do
    url :url
    regex(/^build[._-]?(\d+)$/i)
    strategy :github_latest do |json, regex|
      match = json["tag_name"]&.match(regex)
      next if match.blank?

      "0.1.#{match[1]}"
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "nurmorix.app"
  binary "#{appdir}/nurmorix.app/Contents/MacOS/nurmorix"

  # The build is signed with the project's own certificate, not notarized:
  # without this macOS would refuse to open the downloaded copy.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/nurmorix.app"],
        writable_paths: ["nurmorix.app"],
        writable_base:  :appdir
  end

  uninstall quit: "dev.nvimq.nurmorix"

  zap trash: [
    "~/.config/nurmorix",
    "~/Library/Application Support/nurmorix",
    "~/Library/Caches/dev.nvimq.nurmorix",
    "~/Library/Caches/nurmorix",
    "~/Library/HTTPStorages/dev.nvimq.nurmorix",
    "~/Library/Preferences/dev.nvimq.nurmorix.plist",
  ]
end
