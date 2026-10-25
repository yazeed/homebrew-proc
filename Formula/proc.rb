class Proc < Formula
  desc "Semantic CLI tool for process management"
  homepage "https://github.com/yazeed/proc"
  version "1.13.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-aarch64.tar.gz"
      sha256 "45fed6f5a631442063578825c2a8161c9c4b153e8d16726317a2b0a50895768e"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-x86_64.tar.gz"
      sha256 "812132045fb1deffa9bcceb8be930c4dc74db3cf1bfa2caa00c00978d944be29"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-aarch64.tar.gz"
      sha256 "7411d32f00bfb0cd5222e26a1ecfb452d705300291c5771c5468b2fa29b73525"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-x86_64.tar.gz"
      sha256 "67e58a7a7631196ef9bc77b25f29c980d18fd26468bbbed6eb606d13495485be"
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
