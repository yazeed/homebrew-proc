class Proc < Formula
  desc "Semantic CLI tool for process management"
  homepage "https://proc-cli.com"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-darwin-aarch64.tar.gz"
      sha256 "a8bbc4aea3b17b46ba369b5168db2458fc17044bbb7ba519057d34a2393e2e8f"
    else
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-darwin-x86_64.tar.gz"
      sha256 "df56f1a44782fbdd177f4c560bbca31cc908cef1302e0de8700941199a336f53"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-linux-aarch64.tar.gz"
      sha256 "4a014238dbe254714927d9b0c60be66a3773f522428f2d527255a88823371f67"
    else
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-linux-x86_64.tar.gz"
      sha256 "26ef33d706950b19fca3ca6cce542a131ac1df1e7259ff33184116e9899684ed"
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
