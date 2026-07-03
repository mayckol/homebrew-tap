cask "mcr" do
  version "0.3.3"
  sha256 "8cc537958d82ea3b15f8c4393ef05191cfc0d5cf7a26c5dabec6bab14c0da0dd"

  url "https://github.com/mayckol/mcr/releases/download/v#{version}/MCR_0.3.3_aarch64.dmg"
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
