# The flockfs CLI only (no Mac app). Tap: 0sec-labs/tap (the repo 0sec-labs/homebrew-tap).
#   brew install 0sec-labs/tap/flockfs
# Uses the release-cli.yml builds on dl.flockfs.com (cli/vX.Y.Z/flockfs-<platform>.tar.gz,
# listed in cli/vX.Y.Z/SHA256SUMS). packaging/homebrew/update.sh rewrites the version and
# checksums after a release. The Mac app's cask (Casks/flockfs.rb) links the same CLI from
# inside the app, so install one or the other.
class Flockfs < Formula
  desc "Shared plain-file drives for people and agents: sync, mount and scoped access"
  homepage "https://flockfs.com"
  version "0.1.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://dl.flockfs.com/cli/v#{version}/flockfs-darwin-arm64.tar.gz"
      sha256 "772750e3d56cac8af7354d1bc65874715493546a6b4c6e7061f3aa7d4adcc7e1"
    end
    on_intel do
      url "https://dl.flockfs.com/cli/v#{version}/flockfs-darwin-x86_64.tar.gz"
      sha256 "081d55982573972a55552cd1d636b4f83d37a774d62314482cff33f153533e04"
    end
  end

  on_linux do
    on_arm do
      url "https://dl.flockfs.com/cli/v#{version}/flockfs-linux-aarch64.tar.gz"
      sha256 "83d13f8f3075e37ff76c22874883d549754c6ccfd98e615e4f7dd91b50a99e1b"
    end
    on_intel do
      url "https://dl.flockfs.com/cli/v#{version}/flockfs-linux-x86_64.tar.gz"
      sha256 "db809ec6fc45ddf644641e00349841a1cbab71b8db85cf738051a6ae8a5175fd"
    end
  end

  def install
    bin.install "flockfs"
  end

  test do
    assert_match "flockfs #{version}", shell_output("#{bin}/flockfs --version")
  end
end
