cask "whiteboard" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "e8274d9d95b5d787d1598bcc39be842b42aa19cfd819fbc459db9035aa635d8a",
         intel: "f933fead5dce5c3a784e5a49776480a100f68952769ed3340815ea749ddae4e1"

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
