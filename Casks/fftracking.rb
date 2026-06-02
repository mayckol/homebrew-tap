cask "fftracking" do
  version "0.4.0"
  sha256 "27aa1603aae56028e46b5e32b202346ea4ee2e1163f37a9443ff266f4751f7ce"

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
