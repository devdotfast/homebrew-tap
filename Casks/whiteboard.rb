cask "whiteboard" do
  arch arm: "arm64", intel: "x64"

  version "0.3.1"
  sha256 arm:   "664121c641ebc9ba06faac2e3b7d84d1cd80b1f556b62a0a40b3053a2da31e69",
         intel: "5fe19ccbcd82613e060e1b3f7a0a7915a1e1664b680a2e5120462d9fbfddf147"

  url "https://install.dev.fast/releases/#{version}/darwin-#{arch}/Whiteboard-darwin-#{arch}-#{version}.zip"
  name "/dev/fast Whiteboard"
  desc "Review agent-written code changes"
  homepage "https://dev.fast/"

  livecheck do
    url "https://update.dev.fast/api/update/darwin-arm64/stable/0000000?bundle=Whiteboard"
    strategy :json do |json|
      json["productVersion"]
    end
  end

  auto_updates true
  depends_on macos: :monterey

  app "Whiteboard.app"

  zap trash: [
    "~/.dev-fast-review",
    "~/Library/Application Support/Whiteboard",
    "~/Library/Caches/dev.fast.review",
    "~/Library/Caches/dev.fast.review.ShipIt",
    "~/Library/HTTPStorages/dev.fast.review",
    "~/Library/Preferences/dev.fast.review.plist",
    "~/Library/Saved Application State/dev.fast.review.savedState",
  ]

  caveats <<~EOS
    Whiteboard updates itself. Its welcome page installs the `whiteboard` command.
  EOS
end
