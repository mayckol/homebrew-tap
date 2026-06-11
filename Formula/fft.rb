class Fft < Formula
  desc "Headless CLI + MCP server for fftracking local history"
  homepage "https://github.com/mayckol/fftracking"
  version "0.5.7"

  on_macos do
    url "https://github.com/mayckol/fftracking/releases/download/v#{version}/fft-aarch64-apple-darwin"
    sha256 "caaef20f8bb00ba012f9799a9abe16f4c2847c61155fb76e397a4fea9028b480"
  end
  on_linux do
    url "https://github.com/mayckol/fftracking/releases/download/v#{version}/fft-x86_64-unknown-linux-gnu"
    sha256 "9f8f33edc1fed7ea7328c55331e0872c91987f893237a6b54fdb0827d2284dc0"
  end

  def install
    bin.install Dir["*"].first => "fft"
  end

  test do
    assert_match "fft", shell_output("#{bin}/fft --help")
  end
end
