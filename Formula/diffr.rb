class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/whiteboard/tree/main/diffr"
  version "0.1.20"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.20/diffr-0.1.20-aarch64-apple-darwin.tar.gz"
      sha256 "e3d01b48cbd22866fb9718e4915d3bfecd0ce611fd760497f75170a75eba09d4"
    end
    on_intel do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.20/diffr-0.1.20-x86_64-apple-darwin.tar.gz"
      sha256 "c39348f4a64ff4a97f86cf34fc63c294bd9014a1559d5c962380f8bb6a733c95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.20/diffr-0.1.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6c590e96f2ffe9c715d4a1c649b1cd8b4510c913f19c8a8ed44cc3b78ffeaf1c"
    end
    on_intel do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.20/diffr-0.1.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b38c23820497dd42c379e4fbe8dea60d1ea2fdc4bde91ed78c4dd05c632b51f"
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
