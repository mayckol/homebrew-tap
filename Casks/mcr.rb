cask "mcr" do
  version "0.3.5"
  sha256 "51396ebda56cd6018363da0f1dd08e9edc9a402cce3b7864b0986fbd3cf059fd"

  url "https://github.com/mayckol/mcr/releases/download/v#{version}/MCR_0.3.5_aarch64.dmg"
  name "MCR"
  desc "Three-pane visual git merge editor"
  homepage "https://github.com/mayckol/mcr"

  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "MCR.app"

  # Unsigned/ad-hoc build: strip the download quarantine on install so
  # the app opens on a double-click instead of Gatekeeper blocking it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MCR.app"]
  end

  zap trash: [
    "~/Library/Application Support/dev.mcr.mergeeditor",
  ]
end
