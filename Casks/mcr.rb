cask "mcr" do
  version "0.3.9"
  sha256 "99737242a9eeed0ddba76dba60da6040f9900695210ddfbd7b44e5b6554df6aa"

  url "https://github.com/mayckol/mcr/releases/download/v#{version}/MCR_0.3.9_aarch64.dmg"
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
