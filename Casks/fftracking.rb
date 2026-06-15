cask "fftracking" do
  version "0.8.9"
  sha256 "da518b12bbf0d3539fc4e989e8fa53262e5a1f9b408fd653e08d30b568baef62"

  url "https://github.com/mayckol/fftracking/releases/download/v#{version}/fftracking_0.8.9_aarch64.dmg"
  name "fftracking"
  desc "Local file-history & breaking-point tracker"
  homepage "https://github.com/mayckol/fftracking"

  depends_on macos: :big_sur
  depends_on arch: :arm64
  # Pull in the headless CLI (+ MCP server) so 'brew install --cask
  # fftracking' also puts 'fft' on PATH, matching the install script.
  depends_on formula: "mayckol/tap/fft"

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
