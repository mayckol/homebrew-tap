class Fft < Formula
  desc "Headless CLI + MCP server for fftracking local history"
  homepage "https://github.com/mayckol/fftracking"
  version "0.5.6"

  on_macos do
    url "https://github.com/mayckol/fftracking/releases/download/v#{version}/fft-aarch64-apple-darwin"
    sha256 "364b4295c56164fb4fb5a86e59f33a5b8b88ecbed0ebf22d93b03ebc90404a88"
  end
  on_linux do
    url "https://github.com/mayckol/fftracking/releases/download/v#{version}/fft-x86_64-unknown-linux-gnu"
    sha256 "a281b1cd49175d78d7a5338e4364a3332f8447199be02afc79fb74ed59d87af1"
  end

  def install
    bin.install Dir["*"].first => "fft"
  end

  test do
    assert_match "fft", shell_output("#{bin}/fft --help")
  end
end
