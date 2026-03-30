class Proc < Formula
  desc "Semantic CLI tool for process management"
  homepage "https://github.com/yazeed/proc"
  version "1.12.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-aarch64.tar.gz"
      sha256 "e1b0807a965370d18ad7f516508ab0bc0f8ff9e09f739206b9f653ddd0768a36"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-darwin-x86_64.tar.gz"
      sha256 "1cbd38bb19cd5408bb30672a72f55a566afbe40b456be25cd92a81bd14fe858b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-aarch64.tar.gz"
      sha256 "f82fc8d51b14c0d3e2994f37e1c711cf5a5e306f3eda0fc98f24e7950fcd959f"
    else
      url "https://github.com/yazeed/proc/releases/download/v#{version}/proc-linux-x86_64.tar.gz"
      sha256 "48d22b08ae8770b038bfe31652d4489c549ac8c48a27e8e48ab9d5da0a00d43f"
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
