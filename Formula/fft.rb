class Fft < Formula
  desc "Headless CLI + MCP server for fftracking local history"
  homepage "https://github.com/mayckol/fftracking"
  version "1.0.13"

  on_macos do
    url "https://github.com/mayckol/fftracking/releases/download/v#{version}/fft-aarch64-apple-darwin"
    sha256 "42eac351ad2151d093266c5c84f9d325d7dbcd64478ca987e98924859f4438c6"
  end
  on_linux do
    url "https://github.com/mayckol/fftracking/releases/download/v#{version}/fft-x86_64-unknown-linux-gnu"
    sha256 "0afef89e52c3b150fe55b484ec143bb5f6abd6a18d3a807610da96919e554438"
  end

  def install
    bin.install Dir["*"].first => "fft"
  end

  test do
    assert_match "fft", shell_output("#{bin}/fft --help")
  end
end
