class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/diffr"
  version "0.1.4"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.4/diffr-0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "15d6c2a314a8851ae41ecc9f9942836d609fdbb638000ef2c210b1e4bdcb6334"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.4/diffr-0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "6bb7188ff3b9568ac98f8e2be8537f510b9f81fe9f0f6a24844c98c3178879bb"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/devdotfast/diffr/releases/download/0.1.4/diffr-0.1.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9852012b0b88361510e6af074dac38a5c83bfd61cb287cff938e77152ff0a1d4"
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
