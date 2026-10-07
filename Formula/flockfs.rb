# The flockfs CLI only (no Mac app). Tap: 0sec-labs/tap (the repo 0sec-labs/homebrew-tap).
#   brew install 0sec-labs/tap/flockfs
# Uses the release-cli.yml builds on dl.flockfs.com (cli/vX.Y.Z/flockfs-<platform>.tar.gz,
# listed in cli/vX.Y.Z/SHA256SUMS). packaging/homebrew/update.sh rewrites the version and
# checksums after a release. The Mac app's cask (Casks/flockfs.rb) links the same CLI from
# inside the app, so install one or the other.
class Flockfs < Formula
  desc "Shared plain-file drives for people and agents: sync, mount and scoped access"
  homepage "https://flockfs.com"
  version "0.1.3"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://dl.flockfs.com/cli/v#{version}/flockfs-darwin-arm64.tar.gz"
      sha256 "2e414b45f4cfa2ad37d719918b4d5219dbf4b691af3e44d7f0c79bd9b4617d2c"
    end
    on_intel do
      url "https://dl.flockfs.com/cli/v#{version}/flockfs-darwin-x86_64.tar.gz"
      sha256 "b61070e4648dbe5c924adaec0e394c42024c64b114319e1022ff91bda1f15717"
    end
  end

  on_linux do
    on_arm do
      url "https://dl.flockfs.com/cli/v#{version}/flockfs-linux-aarch64.tar.gz"
      sha256 "cd3831cbd64617673470bafa23fbbfb9419b49b72e835c74a660cf61111bc531"
    end
    on_intel do
      url "https://dl.flockfs.com/cli/v#{version}/flockfs-linux-x86_64.tar.gz"
      sha256 "f1f295e64a655baf7e95de9398b9e39f9ce37417bb95c2afc1af137ffcb6821b"
    end
  end

  def install
    bin.install "flockfs"
  end

  test do
    assert_match "flockfs #{version}", shell_output("#{bin}/flockfs --version")
  end
end
