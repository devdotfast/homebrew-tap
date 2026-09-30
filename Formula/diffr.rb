class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/diffr"
  version "0.1.8"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.8/diffr-0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "819c1402858d84a642a485dbcd3de7d129d2451796de8263b4ed3ff33929e600"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.8/diffr-0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "4d34e8a053ba221418e303465cc553a8bd2ca01465acc0ad68e1a416ef2ee2d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.8/diffr-0.1.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e14815121b9733425d54f5326445f024165378560913dcb911fa15f73593e765"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.8/diffr-0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ea2fdcfade568a94e7f458005512199017ebc2a536442e6fdfe963db8ddd396c"
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
