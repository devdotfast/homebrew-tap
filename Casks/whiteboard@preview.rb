cask "whiteboard@preview" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1-preview.20261003.96"
  sha256 arm:   "e603184af86a4270bedc51527ea925eaea987c847f190ecb2c3a23e5f432fd41",
         intel: "8c5be3487b126939071275a40c16d8b00efcf0f9140d67e7bf62c88ff130692f"

  url "https://install.dev.fast/releases/#{version}/darwin-#{arch}/Whiteboard-darwin-#{arch}-#{version}.zip"
  name "/dev/fast Whiteboard Preview"
  desc "Review agent-written code changes"
  homepage "https://dev.fast/"

  auto_updates true
  depends_on macos: ">= :monterey"

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
