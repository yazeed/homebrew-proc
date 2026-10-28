class Proc < Formula
  desc "Semantic CLI tool for process management"
  homepage "https://github.com/yazeed/proc-cli"
  version "2.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-darwin-aarch64.tar.gz"
      sha256 "0b5b5d5893c51d2082b52f9ddca54497a13b765a7446c97f0f1297c0486d51a0"
    else
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-darwin-x86_64.tar.gz"
      sha256 "1901021a6dd6c71bbad2ca2456dc69292e36c7e3df7d21736232a963da4f843d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-linux-aarch64.tar.gz"
      sha256 "cacc92a3f9fc94ec6206da11c9bd453733f51ea521921a32e91d37ba9af0ff41"
    else
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-linux-x86_64.tar.gz"
      sha256 "dd2f2f479dd0d5a2c6389546800168803a36a6951a564b82b4e71d21668aa909"
    end
  end

  def install
    binary = Dir["proc-*"].first
    bin.install binary => "proc"
  end

  test do
    assert_match "proc", shell_output("#{bin}/proc --version")
  end
end
