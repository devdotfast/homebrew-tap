class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/diffr"
  version "0.1.12"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.12/diffr-0.1.12-aarch64-apple-darwin.tar.gz"
      sha256 "adeeb3f643be3157d83eaa946c2f0f6a0e548ac4f124c555959cc58ce9b4f90b"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.12/diffr-0.1.12-x86_64-apple-darwin.tar.gz"
      sha256 "dbe23dd6461d79a21e7cdefd873ae6f6276da28e14f6bdea7ab2662e4472dd91"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.12/diffr-0.1.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75ed420165fcc5a9f87cbedab875a0ddded6768b330e8d5f426e5a6ea559894e"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.12/diffr-0.1.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d7a0e4f07d6f921b18ade055ba2012ccbce0fc0e4386e66710eaeb60dbdb828a"
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
