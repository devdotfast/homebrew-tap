class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/diffr"
  version "0.1.7"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.7/diffr-0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "58fe55625650cde4777233fa04af3995597e6e6b2f200c77b17900ce2111fa34"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.7/diffr-0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "46004aec3eeb854ad933eeea5ec3172aa4ca492798395e48139e42a9895cb390"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.7/diffr-0.1.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "354fc93f2ce98f84f81feef980795aba2f0d3b2898ca72524147195b8d218e50"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.7/diffr-0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "64cc79458150820ddb78640149cf900fef26fe8927ccfe084b8e7407fea2a6c5"
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
