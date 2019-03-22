require "formula"

class EthereumPlaybook < Formula
  desc "CLI tool that configures and deploys Ethereum DApp infrastructures using a static specification."
  homepage "https://github.com/AtlantPlatform/ethereum-playbook"
  url "https://github.com/AtlantPlatform/ethereum-playbook/archive/v1.0.3.tar.gz"
  sha256 "1d76a010e94faee25be97efbd460530e14cbee6357e9ef5b0f9e91982b616ef8"

  head "https://github.com/AtlantPlatform/ethereum-playbook.git"

  depends_on "go" => :build

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
