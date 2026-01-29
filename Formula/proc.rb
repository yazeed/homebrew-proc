class Proc < Formula
  desc "Semantic process management CLI"
  homepage "https://github.com/yazeed/proc"
  version "1.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-aarch64.tar.gz"
      sha256 "a9b0f8e286dd8627d4cf4c2c4774c904042d2c1b3832f10db8784469af6dfc43"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-x86_64.tar.gz"
      sha256 "bb1772b628db024b30c4681589fd5e6c04585a592e9ae235cfbbf912a676dbdd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-aarch64.tar.gz"
      sha256 "e2cd4d46312afdbb0360e89d708103052580502fadd05288634cf5aa2cc3dd84"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-x86_64.tar.gz"
      sha256 "931ca0e1466f0a6495e28246e8dd52a65c7db08922cbf3c50e7d6a03258476fc"
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
