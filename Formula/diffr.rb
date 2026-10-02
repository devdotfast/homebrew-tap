class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/diffr"
  version "0.1.10"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.10/diffr-0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "ed6985387c5939527f86766758aeb3050928c1dc3003c3832ce80a54ee19ef15"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.10/diffr-0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "5bcb94d12978cef9f1ad9c08e6f887de43671ebe8e199ce59fb021d61c8fa704"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.10/diffr-0.1.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3fcaee71083c22a7d95fb524a01264547a4e1a9dff6cccbed8fa22c57dca4cc0"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.10/diffr-0.1.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1f789ad682b4018759405c524d1a3e09460bc4498e77d09ffa1c1b83c185bdf7"
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
