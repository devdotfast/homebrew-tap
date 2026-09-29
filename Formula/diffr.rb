class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/diffr"
  version "0.1.5"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.5/diffr-0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "0c04f6888676e4baab8d7e1fedb3c7efef8c99aca3d9250f9097bb35043100bf"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.5/diffr-0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "0a6acd1bbcc472ff114bb15ee661e0e31e8f59ab05559f4f30b692acdf436868"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/devdotfast/diffr/releases/download/0.1.5/diffr-0.1.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "24322080b6b37f3ce3f87b18603804bb767d85077f12431076bb94c44da9bc4a"
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
