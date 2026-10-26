cask "whiteboard@preview" do
  arch arm: "arm64", intel: "x64"

  version "0.4.1-preview.20261026.140"
  sha256 arm:   "c2de5acb1feac6010a20e502312f850933574594fdf264a4efe46acacf534e48",
         intel: "6d667d0c65ee91cf6713505810343eb8754fd0c9fe1f59ba7c1d285b7bbb0055"

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
