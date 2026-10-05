cask "whiteboard" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "0715f4930b1f875923a4fd26eba3ede286b51663ea6c4f0cf11a2260e36ee712",
         intel: "7cd6d3ce00b370c1dd6c71a895b0aa4d7a63ba8680eb2fca87e27e7e6a9928b4"

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
