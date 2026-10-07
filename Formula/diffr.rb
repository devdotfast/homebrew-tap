class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/diffr"
  version "0.1.14"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.14/diffr-0.1.14-aarch64-apple-darwin.tar.gz"
      sha256 "c6400f88cfe4eb3651c22ef4bd60243bd28f29a64002dbf230f0990fd7bc076f"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.14/diffr-0.1.14-x86_64-apple-darwin.tar.gz"
      sha256 "4458d43f19d921f167696560be46418e108c89fcfceea7d21c88e6bbdb453ad5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.14/diffr-0.1.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c09aa4ccf0eaa1b667e4206ebdaef4be321bed9e70fc17a280bce5e8811eecce"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.14/diffr-0.1.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b1579711f1869ffa8afecb296750b540fe2e6afa8ec7b6b9b3542ed3f2fe0502"
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
