class Fft < Formula
  desc "Headless CLI + MCP server for fftracking local history"
  homepage "https://github.com/mayckol/fftracking"
  version "1.0.4"

  on_macos do
    url "https://github.com/mayckol/fftracking/releases/download/v#{version}/fft-aarch64-apple-darwin"
    sha256 "a4f919852524c55791d31f94ff02da65f86904a3bf1151df9127f6b54541ebb8"
  end
  on_linux do
    url "https://github.com/mayckol/fftracking/releases/download/v#{version}/fft-x86_64-unknown-linux-gnu"
    sha256 "eee976ba22cabfd88ccb881b3d42a4a616ab09686ce0614b78c93d10757d2bcc"
  end

  def install
    bin.install Dir["*"].first => "fft"
  end

  test do
    assert_match "fft", shell_output("#{bin}/fft --help")
  end
end
