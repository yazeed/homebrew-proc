class Proc < Formula
  desc "Semantic CLI tool for process management"
  homepage "https://github.com/yazeed/proc-cli"
  version "1.14.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-darwin-aarch64.tar.gz"
      sha256 "921c370a15ad55b2fe6777e91b5e5d8b7675c0bf0aa40eb2c393203b64bea4f3"
    else
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-darwin-x86_64.tar.gz"
      sha256 "966346f6ced4d1eb606ff333996a9c8c142cc74c7f59da3af75ecb8367d85a21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-linux-aarch64.tar.gz"
      sha256 "a5301db40a7918b589961d3cc5ab5f2ccb32e64aab22dd691577a33358280baa"
    else
      url "https://github.com/yazeed/proc-cli/releases/download/v#{version}/proc-linux-x86_64.tar.gz"
      sha256 "e9c0b1d9fe361a4cbaefa354eec21602ef8a52af5b56c7c017bff5f82a2e4c38"
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
