class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/whiteboard/tree/main/diffr"
  version "0.1.22"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.22/diffr-0.1.22-aarch64-apple-darwin.tar.gz"
      sha256 "d835b5ca6372448e53a6967f8e096b72c106cc28024b8448018456fc90d46c99"
    end
    on_intel do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.22/diffr-0.1.22-x86_64-apple-darwin.tar.gz"
      sha256 "46d394c181e8938d917691b197adcd813e638a878f43a49854bac184b3c10600"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.22/diffr-0.1.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5cd10d3ad29aaf8589818645e9a82b6bd407c16d8ed699f9eb2f80223fa5ac4b"
    end
    on_intel do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.22/diffr-0.1.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7fb09c63d532c44ccfc9e6536520ba97d7344ef328e50f761ed2278ad42f3ef"
    end
  end

  def install
    bin.install "diffr", "diffr-tui"
    doc.install "NOTICE"
    (pkgshare/"licenses").install "LICENSE"
    (pkgshare/"licenses/tui").install "packages/tui/LICENSE"
    (pkgshare/"licenses/themes").install "packages/viewer/themes/LICENSE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diffr --version")
    assert_match "theme", shell_output("#{bin}/diffr config schema")
    assert_predicate bin/"diffr-tui", :executable?
  end
end
