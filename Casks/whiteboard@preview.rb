cask "whiteboard@preview" do
  arch arm: "arm64", intel: "x64"

  version "0.3.1-preview.20261016.122"
  sha256 arm:   "ddd7c35ed5cf31f55c3c661be0c33f7e4b6f06ce6dcaf199f7cab43e73a2b2d5",
         intel: "9d0163c8c1d8bd197f7313531d05d6d3514ed26222e94c1cdcc2db807f8eac37"

  url "https://install.dev.fast/releases/#{version}/darwin-#{arch}/Whiteboard-darwin-#{arch}-#{version}.zip"
  name "/dev/fast Whiteboard Preview"
  desc "Review agent-written code changes"
  homepage "https://dev.fast/"

  livecheck do
    url "https://update.dev.fast/api/update/darwin-arm64/preview/0000000?bundle=Whiteboard%20Preview"
    strategy :json do |json|
      json["productVersion"]
    end
  end

  auto_updates true
  depends_on macos: :monterey

  app "Whiteboard Preview.app"

  zap trash: [
    "~/.dev-fast-review-preview",
    "~/Library/Application Support/Whiteboard Preview",
    "~/Library/Caches/dev.fast.review.preview",
    "~/Library/Caches/dev.fast.review.preview.ShipIt",
    "~/Library/HTTPStorages/dev.fast.review.preview",
    "~/Library/Preferences/dev.fast.review.preview.plist",
    "~/Library/Saved Application State/dev.fast.review.preview.savedState",
  ]

  caveats <<~EOS
    Whiteboard Preview updates itself. Its welcome page installs the `whiteboard` command.
  EOS
end
