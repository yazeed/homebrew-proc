class Proc < Formula
  desc "Semantic CLI tool for process management"
  homepage "https://proc-cli.com"
  version "2.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-darwin-aarch64.tar.gz"
      sha256 "a558c184c556d43b3d4fba000ef05d9b09a3836f797e309536496116804635fc"
    else
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-darwin-x86_64.tar.gz"
      sha256 "ae019fbffb3e67b02adf3a0fc8768dd50d16483012f52bf3b946f958f71039a6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-linux-aarch64.tar.gz"
      sha256 "b1dad3f0ac4d8895a41038f9b6219f6071fda2a658d0a7df61109aa704eca485"
    else
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-linux-x86_64.tar.gz"
      sha256 "0bd248fd3a0c57190500f00273ee1b601c8cbd1fe40eb91ebf68295109acbf8a"
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
