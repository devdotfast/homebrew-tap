class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/whiteboard/tree/main/diffr"
  version "0.1.21"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.21/diffr-0.1.21-aarch64-apple-darwin.tar.gz"
      sha256 "f3106d9b885e1dc259c68ad8c4521391e477de7ce92761273456405e5595e5bc"
    end
    on_intel do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.21/diffr-0.1.21-x86_64-apple-darwin.tar.gz"
      sha256 "d8ff3c58aed2946d0bd54a6a4b4447b3ed34664f9041d49b25543f5de1b18063"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.21/diffr-0.1.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "713c0bcace9af1815117ad9f06d7e329b80c642b67a6241c708720b73741089d"
    end
    on_intel do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.21/diffr-0.1.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4aaf40ad3b3690dd4df8603f8b9172c041f3f768d31802af66a53ca047f07110"
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
