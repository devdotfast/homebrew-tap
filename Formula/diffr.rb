class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/diffr"
  version "0.1.2"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/devdotfast/diffr/releases/download/0.1.2/diffr-0.1.2-aarch64-apple-darwin.tar.gz"
    sha256 "f1b5ff849124bf389be3aaa4e6b4b0acfcbfe8f6c7c102b0f44f84e41a7555e9"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/devdotfast/diffr/releases/download/0.1.2/diffr-0.1.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "97ef3a24dc6ca19fa699f0e989fcd59699336558f4ac5e57ed404c89b6a0f9d4"
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
