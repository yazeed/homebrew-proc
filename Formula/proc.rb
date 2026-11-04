class Proc < Formula
  desc "Semantic CLI tool for process management"
  homepage "https://proc-cli.com"
  version "2.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-darwin-aarch64.tar.gz"
      sha256 "a969ab2e6513d3af0507d8c29ba83e2c6522ac88bd166b0f235a8122ab9d3304"
    else
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-darwin-x86_64.tar.gz"
      sha256 "0e5cc53e2afc074b7c75c0a2610671723fdbc4562659b885dbae9d4b49eeec61"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-linux-aarch64.tar.gz"
      sha256 "fa5fb2fd56ecea059979a3095360354342fe12a9c6d1208b485978b3406293e3"
    else
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-linux-x86_64.tar.gz"
      sha256 "34b0d1f8ae19a8bdd7dce03d0dd3ebcc595c06e2242c7a39fcac462eaff36395"
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
