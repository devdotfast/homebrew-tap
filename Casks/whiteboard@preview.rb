cask "whiteboard@preview" do
  arch arm: "arm64", intel: "x64"

  version "0.4.1-preview.20261027.141"
  sha256 arm:   "9083ea34a7f1b815d7b0a1a2c058f04f665f196fc37669c4369e5c32c4c12b4d",
         intel: "0d289c84816a758b804121a520e665dc0cec6800a4b6cbe7eec8bc8e661b3482"

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
