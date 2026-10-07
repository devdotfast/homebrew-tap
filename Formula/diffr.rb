class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/diffr"
  version "0.1.15"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.15/diffr-0.1.15-aarch64-apple-darwin.tar.gz"
      sha256 "3d999f95980babc356f376f40bb55eaf5f97ba65b50384295964a4ac79d9e99e"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.15/diffr-0.1.15-x86_64-apple-darwin.tar.gz"
      sha256 "1cc9955a801fb6afcac0d11386a92940a0f472ca912562ddba7a0c86915d1641"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.15/diffr-0.1.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "88d379cc7e3e8c6acfeb148f84ba42fc86f33332d6f5f69257ff696951aaad25"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.15/diffr-0.1.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a90552982e415a6c403084daf64bba6ab468f919d63d082b997714c8a8068fb"
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
