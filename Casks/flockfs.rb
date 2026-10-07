# flockfs for Mac: the File Provider app (drives under Locations in Finder) with the
# flockfs CLI inside. Tap: 0sec-labs/tap (the repo 0sec-labs/homebrew-tap).
#   brew install --cask 0sec-labs/tap/flockfs
# The same signed, notarized DMG as the "Download for Mac" link. The app updates itself
# (Sparkle), hence `auto_updates`. packaging/homebrew/update.sh rewrites version and sha256
# after a release (from mac/vX.Y.Z/SHA256SUMS). It links the same `flockfs` command as the
# CLI-only formula (Formula/flockfs.rb), so install one or the other.
cask "flockfs" do
  version "0.1.0"
  sha256 "53b3df86069326713d3dc35c93c2032bdeb2a009a758fe9108ff78b91a88b4f7"

  url "https://dl.flockfs.com/mac/flockfs-#{version}.dmg"
  name "flockfs"
  desc "Shared drives in Finder for people and agents"
  homepage "https://flockfs.com/"

  livecheck do
    url "https://dl.flockfs.com/mac/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :ventura

  # File Provider only loads extensions of apps in an Applications folder.
  app "flockfs.app"
  binary "#{appdir}/flockfs.app/Contents/Helpers/flockfs"

  uninstall quit: "com.flockfs.mac"

  zap trash: [
    "~/Library/Application Scripts/com.flockfs.mac.FileProvider",
    "~/Library/Caches/com.flockfs.mac",
    "~/Library/Containers/com.flockfs.mac.FileProvider",
    "~/Library/Group Containers/8LXLA64L66.group.com.flockfs.mac",
    "~/Library/HTTPStorages/com.flockfs.mac",
    "~/Library/Preferences/com.flockfs.mac.plist",
  ]

  caveats <<~EOS
    Two steps need you (they are your consent; an AI agent may do them only when you asked it to set up flockfs):
      1. Open flockfs and sign in: the app opens your browser; click Allow.
           open -a flockfs
      2. Turn flockfs on once: System Settings → General → Login Items & Extensions →
         File Providers → flockfs
           deep link: x-apple.systempreferences:com.apple.ExtensionsPreferences?extensionPointIdentifier=com.apple.fileprovider-nonui
    Your drives then appear under Locations in Finder. The `flockfs` command links to the
    CLI inside the app and updates with it.
  EOS
end
