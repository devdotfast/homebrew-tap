class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/diffr"
  version "0.1.11"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.11/diffr-0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "3d8714fed782f42a7c6d7193e74f922e5f92339d4d98c878ced6f91d1a59ed4f"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.11/diffr-0.1.11-x86_64-apple-darwin.tar.gz"
      sha256 "ed274c68cb9028e3a320e96d3e7a45294ab2ef43c0aa1ec717e5ebd4937c874d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.11/diffr-0.1.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9f3a9e007d92497d13fd1838796138c870e96d0cbca39b45c79875efbe2cd237"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.11/diffr-0.1.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d6a8a8899b89ea2a618bed60bf97e23faa267e85ee60cbd729d2658c85529b6d"
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
