class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/whiteboard/tree/main/diffr"
  version "0.1.17"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.17/diffr-0.1.17-aarch64-apple-darwin.tar.gz"
      sha256 "72e51de778d6bd16cbc938a22329ae8f2fc4932e6693850b6c35fbf85c669f43"
    end
    on_intel do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.17/diffr-0.1.17-x86_64-apple-darwin.tar.gz"
      sha256 "934df0775355b05214e5c71837028c8787834c50ed4c0564ca848c2b8cbf6bc9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.17/diffr-0.1.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4a537031d3e6c8cc84d7fcbacf2585a6e12bfbe1ddcc745e32313e3f7135cb50"
    end
    on_intel do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.17/diffr-0.1.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "196ba55ccadcbbdd6bcb4ab10ff579d6b104ae2a3687818a659b69476705852b"
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
