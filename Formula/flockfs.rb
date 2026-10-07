# The flockfs CLI only (no Mac app). Tap: 0sec-labs/tap (the repo 0sec-labs/homebrew-tap).
#   brew install 0sec-labs/tap/flockfs
# Uses the release-cli.yml builds on dl.flockfs.com (cli/vX.Y.Z/flockfs-<platform>.tar.gz,
# listed in cli/vX.Y.Z/SHA256SUMS). packaging/homebrew/update.sh rewrites the version and
# checksums after a release. The Mac app's cask (Casks/flockfs.rb) links the same CLI from
# inside the app, so install one or the other.
class Flockfs < Formula
  desc "Shared plain-file drives for people and agents: sync, mount and scoped access"
  homepage "https://flockfs.com"
  version "0.1.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://dl.flockfs.com/cli/v#{version}/flockfs-darwin-arm64.tar.gz"
      sha256 "354f945e0a22d75218c1b2b318cc3cbf203052117aa1610e9047038617d293c9"
    end
    on_intel do
      url "https://dl.flockfs.com/cli/v#{version}/flockfs-darwin-x86_64.tar.gz"
      sha256 "7b72de314111e536bfb86463f53ee2cc9357b54e657a294e8a18f240a1755cb3"
    end
  end

  on_linux do
    on_arm do
      url "https://dl.flockfs.com/cli/v#{version}/flockfs-linux-aarch64.tar.gz"
      sha256 "2d44c83af6e386d42c4e03976216c4220064a489aac375dfa8908fe952678177"
    end
    on_intel do
      url "https://dl.flockfs.com/cli/v#{version}/flockfs-linux-x86_64.tar.gz"
      sha256 "a63a33a01483558bab04ffab040e41ae9745aa71ba8a8bc3851a3e5745a400e7"
    end
  end

  def install
    bin.install "flockfs"
  end

  test do
    assert_match "flockfs #{version}", shell_output("#{bin}/flockfs --version")
  end
end
