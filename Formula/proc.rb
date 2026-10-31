class Proc < Formula
  desc "Semantic CLI tool for process management"
  homepage "https://proc-cli.com"
  version "2.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-darwin-aarch64.tar.gz"
      sha256 "a6057454cea5afda3dd532e8a5da06cad5bb623b33f4db89d7a8f9dce9419d41"
    else
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-darwin-x86_64.tar.gz"
      sha256 "3cf2ac4a0189b80195e19aa96060158de45f441f079f84f15bd157bfe2923d56"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-linux-aarch64.tar.gz"
      sha256 "3fcf34ce2b9362f87d49ad82148db6719b78396cffe93ce0153d82a604bba989"
    else
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-linux-x86_64.tar.gz"
      sha256 "8ff7a59beb67c9cbe29f3a1203f8965e359bf62e0cabfd987a2df4a173d319c8"
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
