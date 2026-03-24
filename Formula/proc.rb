class Proc < Formula
  desc "Semantic CLI tool for process management"
  homepage "https://github.com/yazeed/proc"
  version "1.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-aarch64.tar.gz"
      sha256 "c8a87c7ea395a62e0bab013238d75c1d2d4baa1340772b32f1a1919f3b94317c"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-x86_64.tar.gz"
      sha256 "9fea9577290870ee48cf7955563bc3873d18034ca929b7f7b2ccf04646302047"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-aarch64.tar.gz"
      sha256 "6720ae312da6b9a8abf1f951360758ba70b1e23fb91f56162a24448a14ca216a"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-x86_64.tar.gz"
      sha256 "52994a033d7f5677cc8dd0da36f35eb4c2c9a6d4de5bb3ae264dc76745061cc3"
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
