class Fft < Formula
  desc "Headless CLI + MCP server for fftracking local history"
  homepage "https://github.com/mayckol/fftracking"
  version "1.1.0"

  on_macos do
    url "https://github.com/mayckol/fftracking/releases/download/v#{version}/fft-aarch64-apple-darwin"
    sha256 "60c7a0efb22710b6db2e6c92a65d8e8e6390724fdeb09d88d8afc0f338eac4fd"
  end
  on_linux do
    url "https://github.com/mayckol/fftracking/releases/download/v#{version}/fft-x86_64-unknown-linux-gnu"
    sha256 "b6ff43b3a7442d98cbe4f7d9ac9a5887f161809ba0ace04994b90a7bf4d32a12"
  end

  def install
    bin.install Dir["*"].first => "fft"
  end

  test do
    assert_match "fft", shell_output("#{bin}/fft --help")
  end
end
