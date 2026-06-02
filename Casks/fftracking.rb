cask "fftracking" do
  version "0.3.0"
  sha256 "69f8ff5c05ee80e29eacc53f20fbf6111b7e54a2fe5d3e4a26dec3dfdd02517b"

  url "https://github.com/mayckol/fftracking/releases/download/v#{version}/fftracking_#{version}_aarch64.dmg"
  name "fftracking"
  desc "Local file-history & breaking-point tracker"
  homepage "https://github.com/mayckol/fftracking"

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "fftracking.app"

  zap trash: [
    "~/Library/Application Support/com.fftracking.app",
  ]
end
