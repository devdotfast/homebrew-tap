cask "whiteboard" do
  arch arm: "arm64", intel: "x64"

  version "0.2.4"
  sha256 arm:   "ca3d528f67e4366e98e00b649e1f56cbbc306cf6f06b3a1a932174fc12703e2f",
         intel: "37b5537838979e826d7c40e859c10a11cd5ba967038576a96592a192836ae3ef"

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
