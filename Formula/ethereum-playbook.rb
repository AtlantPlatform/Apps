require "formula"

class EthereumPlaybook < Formula
  desc "CLI tool that configures and deploys Ethereum DApp infrastructures using a static specification."
  homepage "https://github.com/AtlantPlatform/ethereum-playbook"
  url "https://github.com/AtlantPlatform/ethereum-playbook/archive/v1.0.0.tar.gz"
  sha256 "201074df71d1f43c40c0f4b6509bf7c92466d92c22fc94cf4e7c5283f8e2716d"

  head "https://github.com/AtlantPlatform/ethereum-playbook.git"

  depends_on "go" => :build

  bottle do
    root_url "https://homebrew.bintray.com/bottles-apps"
    cellar :any_skip_relocation
    sha256 "36fe4ff2869a97c555847b68b4c7895dc0b11e86a48398f1d4de49208df8d894" => :high_sierra
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
