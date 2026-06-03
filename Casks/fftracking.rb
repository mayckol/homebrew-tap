cask "fftracking" do
  version "0.5.3"
  sha256 "9f160b80e34006a2a25f8b63745fe52adb27e3e24ebfc74b0db676b0387edbfd"

  url "https://github.com/mayckol/fftracking/releases/download/v#{version}/fftracking_#{version}_aarch64.dmg"
  name "fftracking"
  desc "Local file-history & breaking-point tracker"
  homepage "https://github.com/mayckol/fftracking"

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "fftracking.app"

  # Unsigned/ad-hoc build: strip the download quarantine on install so
  # the app opens on a double-click instead of Gatekeeper blocking it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/fftracking.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.fftracking.app",
  ]
end
