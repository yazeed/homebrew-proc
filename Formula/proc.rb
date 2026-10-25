class Proc < Formula
  desc "Semantic CLI tool for process management"
  homepage "https://github.com/yazeed/proc"
  version "1.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-aarch64.tar.gz"
      sha256 "1f4237347e032cae40bc36bb4f28315829751835529799ca3c1d95bc799180fe"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-x86_64.tar.gz"
      sha256 "add628088ff8783dec9390595fb70f9e6d2dbd267ef2fbe1525010c46d2a40b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-aarch64.tar.gz"
      sha256 "5fe67bb074b47e7ae1c423f5072fe6c1da56397f6efed90785949ca54f266c6e"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-x86_64.tar.gz"
      sha256 "613682faedc251e48b96128d7a8d9cd3f8c63e1d7ba8b8109d9ea25fc8a522e0"
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
