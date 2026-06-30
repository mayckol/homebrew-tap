cask "mcr" do
  version "0.1.0"
  sha256 "9c54ce05882f0c32597d8d1e6084e820c7729fd7ad7e77675a8a3ba9514a4e20"

  url "https://github.com/mayckol/mcr/releases/download/v#{version}/MCR_0.1.0_aarch64.dmg"
  name "MCR"
  desc "Three-pane visual git merge editor"
  homepage "https://github.com/mayckol/mcr"

  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "MCR.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MCR.app"]
  end

  zap trash: [
    "~/Library/Application Support/dev.mcr.mergeeditor",
  ]
end
