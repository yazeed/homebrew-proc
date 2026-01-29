class Proc < Formula
  desc "Semantic process management CLI"
  homepage "https://github.com/yazeed/proc"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-aarch64.tar.gz"
      sha256 "6c9b6636c352634638fb6d1b8893fffe5e40814b9aceb45a90eb2fbe57cd7d3c"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-x86_64.tar.gz"
      sha256 "5f52ccea89426a84dea1abdee2257bec0c07368e51b920be5c1b3f1abf36b33a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-aarch64.tar.gz"
      sha256 "321e4ddcd546e724bdb193e34e98df418799193f78901ddd6ebaff85b958cc6e"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-x86_64.tar.gz"
      sha256 "8fcedf9ca02cecd78444fc5058fdb953fdee21dd8255fe74e0636869e6c17b0d"
    end
  end

  def install
    # Binary is named proc-{platform}-{arch}, rename to proc
    binary = Dir["proc-*"].first
    bin.install binary => "proc"
  end

  test do
    assert_match "proc", shell_output("#{bin}/proc --version")
  end
end
