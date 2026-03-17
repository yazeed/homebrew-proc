class Proc < Formula
  desc "Semantic CLI tool for process management"
  homepage "https://github.com/yazeed/proc"
  version "1.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-aarch64.tar.gz"
      sha256 "8958deb72ae7502c31fdb4b18d7a4b272c60d8fa4d2ac23db2cedcf8ab2b8535"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-x86_64.tar.gz"
      sha256 "53c0025ac9f4e4c5c05592d1ad92d3943fed471eb6cf85450dcd9fb71dacd8da"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-aarch64.tar.gz"
      sha256 "3a108bcaa520c6cd851c56a48f8271f501b41bf8ca47dc4d8712c8c37c6551b1"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-x86_64.tar.gz"
      sha256 "bf2f78bf519b07207e8b1e5febecff62a140a759b751b75a9827429f8cda20ad"
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
