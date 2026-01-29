class Proc < Formula
  desc "Semantic CLI tool for process management"
  homepage "https://github.com/yazeed/proc"
  version "1.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-aarch64.tar.gz"
      sha256 "4ca06c321cfa0b6a81f80250609a55982bcd04f5be13caefaa24c16589cc7d34"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-x86_64.tar.gz"
      sha256 "8487adaff7ba178f0895223b367305f4f9ecd2aa70ec8d9f72995eef43627e58"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-aarch64.tar.gz"
      sha256 "a4fb19c23e881a74e5bd37af8ebba3c441b7b2d9ae1714ffffb66e5b8153860d"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-x86_64.tar.gz"
      sha256 "5c322065be804180fdce12d3a3b048f897eb138b6b15c5080895d3aea447cf0c"
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
