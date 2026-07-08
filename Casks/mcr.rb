cask "mcr" do
  version "0.3.11"
  sha256 "fb0d7eb7441d604779eb71ba09a3491c45a72fd5e09affacf45fb4048b86d91f"

  url "https://github.com/mayckol/mcr/releases/download/v#{version}/MCR_0.3.11_aarch64.dmg"
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
