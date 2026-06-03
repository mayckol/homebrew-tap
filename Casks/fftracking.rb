cask "fftracking" do
  version "0.4.2"
  sha256 "7f8df7fc05eba079e01d9a5804eae437df6883cce6d4444177de870863604c99"

  url "https://github.com/mayckol/fftracking/releases/download/v#{'#'}{version}/fftracking_#{'#'}{version}_aarch64.dmg"
  name "fftracking"
  desc "Local file-history & breaking-point tracker"
  homepage "https://github.com/mayckol/fftracking"

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "fftracking.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{'#'}{appdir}/fftracking.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.fftracking.app",
  ]
end
