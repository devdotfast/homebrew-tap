class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/diffr"
  version "0.1.6"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.6/diffr-0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "e98e045fa09145782e2fa2b362d00c45c179cb2ee9e3589f641dfd08835a6651"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.6/diffr-0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "5a4157bd621953f3dd5977003913c9747ac235ab1ac70760d4a019e50ac7a68f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.6/diffr-0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eb35d2dad1204f13c3544aa013ee6ee842f1834f1a725d2b4193fe9e9797d475"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.6/diffr-0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "39d3fa62441bdf93e73e8d19e3fd76f1810c8adb247d9ad5d711ce51e6c1719d"
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
