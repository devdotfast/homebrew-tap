cask "whiteboard@preview" do
  arch arm: "arm64", intel: "x64"

  version "0.3.5-preview.20261023.135"
  sha256 arm:   "3d62f30c00f849ccd3b923e7aa08ea3dae0196ac23e939bf428946b32159dfd6",
         intel: "8b8755c2a0ec36590a5981f08640972a1376699e8048517c42d78a4e8fe3065c"

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
