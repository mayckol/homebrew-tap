cask "fftracking" do
  version "0.5.2"
  sha256 "a230a50d23fc9537ab7b7b098aac43d7e183941a17437daa5ec474a0445d6a9f"

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
