class Proc < Formula
  desc "Semantic CLI tool for process management"
  homepage "https://github.com/yazeed/proc"
  version "1.12.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-aarch64.tar.gz"
      sha256 "c98e8b1c81d4be4a50bde5130cb8972ff001e3e418ef510bce49c4a8224ad8fe"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-x86_64.tar.gz"
      sha256 "370650d93f5516dfd01521f75c3b00270f5dde36c44dd24ece8d37f22b95f972"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-aarch64.tar.gz"
      sha256 "e76f59bb1568c46a00cbc338dd6d2703d758a425f8b6fce4e5f2c5f0d7125141"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-x86_64.tar.gz"
      sha256 "ef6f1ad3fa49a0bf57b1586b8c7719e1b9def688839526d511ae0d1bc601e2c3"
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
