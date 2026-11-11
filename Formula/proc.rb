class Proc < Formula
  desc "Semantic CLI tool for process management"
  homepage "https://proc-cli.com"
  version "2.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-darwin-aarch64.tar.gz"
      sha256 "b666f9397e249000bb7cba0e184fcbffd629b6330a4e3222f7baedf7fdd43955"
    else
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-darwin-x86_64.tar.gz"
      sha256 "e23bc814b0adee2e78c90cb5e514bf56def404af3ffcbdf3c2c3cccf28d95a1e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-linux-aarch64.tar.gz"
      sha256 "616d4d5bcc2accc132f0d69a1b4db22e936a4f3c06b1e7bd8f5bafcd7584c9e5"
    else
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-linux-x86_64.tar.gz"
      sha256 "2aeb0af9835f720b604b7869a765677d9a499860407e46483ab98cbd5c356397"
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
