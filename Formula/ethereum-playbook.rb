require "formula"

class EthereumPlaybook < Formula
  desc "CLI tool that configures and deploys Ethereum DApp infrastructures using a static specification."
  homepage "https://github.com/AtlantPlatform/ethereum-playbook"
  url "https://github.com/AtlantPlatform/ethereum-playbook/archive/v1.0.2.tar.gz"
  sha256 "e2faa8c03013b0601be4ef8d3a38bed34409a42dd8c185cd98831bb4e32e3692"

  head "https://github.com/AtlantPlatform/ethereum-playbook.git"

  depends_on "go" => :build

  bottle do
    root_url "https://homebrew.bintray.com/bottles-apps"
    cellar :any_skip_relocation
    sha256 "9da252aa80cea38cd6e6443bffee88e6d29d855e40144b737369a796f3663388" => :high_sierra
  end

  def install
    ENV["GOPATH"] = buildpath

    mkdir_p "#{buildpath}/src/github.com/AtlantPlatform"
    ln_sf buildpath, "#{buildpath}/src/github.com/AtlantPlatform/ethereum-playbook"
    system "go", "build", "-o", "ethereum-playbook", "github.com/AtlantPlatform/ethereum-playbook"
    bin.install "ethereum-playbook"
  end

  test do
    system "#{bin}/ethereum-playbook", "-h"
  end
end
