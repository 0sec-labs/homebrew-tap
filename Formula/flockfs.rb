# The flockfs CLI only (no Mac app). Tap: 0sec-labs/tap (the repo 0sec-labs/homebrew-tap).
#   brew install 0sec-labs/tap/flockfs
# Uses the release-cli.yml builds on dl.flockfs.com (cli/vX.Y.Z/flockfs-<platform>.tar.gz,
# listed in cli/vX.Y.Z/SHA256SUMS). packaging/homebrew/update.sh rewrites the version and
# checksums after a release. The Mac app's cask (Casks/flockfs.rb) links the same CLI from
# inside the app, so install one or the other.
class Flockfs < Formula
  desc "Shared plain-file drives for people and agents: sync, mount and scoped access"
  homepage "https://flockfs.com"
  version "0.1.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://dl.flockfs.com/cli/v#{version}/flockfs-darwin-arm64.tar.gz"
      sha256 "c458b244ec0225515656e8862eee1bce5712b1456ae80ba802cf75b5c8b9ef05"
    end
    on_intel do
      url "https://dl.flockfs.com/cli/v#{version}/flockfs-darwin-x86_64.tar.gz"
      sha256 "c8bd402df6e21385277e306636f423a62d5e5b9f549c7cdf8542bff8dc32c4da"
    end
  end

  on_linux do
    on_arm do
      url "https://dl.flockfs.com/cli/v#{version}/flockfs-linux-aarch64.tar.gz"
      sha256 "0b9341100365f2a98edb5705b957f676ed03da630449902d37634a71f9caeb6f"
    end
    on_intel do
      url "https://dl.flockfs.com/cli/v#{version}/flockfs-linux-x86_64.tar.gz"
      sha256 "1469a2f53f7e9bb34b1f43e72180eca584c6a4075f376e93b7eccc94e60d08e0"
    end
  end

  def install
    bin.install "flockfs"
  end

  test do
    assert_match "flockfs #{version}", shell_output("#{bin}/flockfs --version")
  end
end
