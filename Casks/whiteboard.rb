cask "whiteboard" do
  arch arm: "arm64", intel: "x64"

  version "0.3.3"
  sha256 arm:   "31a8c830436bf0af1c0b2e3e6b5b7296c023c1ee0dc498682debf32d62756dac",
         intel: "1faeb0c55bcbade07fd43eb37b1a54cb240d2bc5c79fb91d53ab04ec41d498b5"

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
