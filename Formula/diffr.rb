class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/diffr"
  version "0.1.9"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.9/diffr-0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "74db512b9088ca6f2e2078fc149b7d7678a9ffe802bffaab3f4ee730a6a0d876"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.9/diffr-0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "47103be82ba7abfd0530dfd211b43a41834b62080fcf14f09a3177c90b96104b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.9/diffr-0.1.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7bcafb3b4a7c525e3bcdbeb4e03ca039d846ef2f1413cb610fd6ff9b20a2dc99"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.9/diffr-0.1.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2a751e9707953e672f3f971b4ce8029a3c41b6a3b820f60fb1898c4998b4c84"
    end
  end

  def install
    bin.install "diffr", "diffr-tui"
    doc.install "NOTICE"
    (pkgshare/"licenses").install "LICENSE"
    (pkgshare/"licenses/tui").install "tui/LICENSE"
    (pkgshare/"licenses/themes").install "tui/themes/LICENSE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diffr --version")
    assert_match "theme", shell_output("#{bin}/diffr config schema")
    assert_predicate bin/"diffr-tui", :executable?
  end
end
