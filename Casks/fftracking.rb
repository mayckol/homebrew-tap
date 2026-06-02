cask "fftracking" do
  version "0.4.1"
  sha256 "87b7d74169e83ff5653d1f2e5cec83571ca31528bb905c66b8dd90f3b120044c"

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
