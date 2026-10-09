class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/whiteboard/tree/main/diffr"
  version "0.1.18"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.18/diffr-0.1.18-aarch64-apple-darwin.tar.gz"
      sha256 "5709e5346417d7efc3cbb8c4df9ce8b3f63bfac5973c5d62cb98115c901e370f"
    end
    on_intel do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.18/diffr-0.1.18-x86_64-apple-darwin.tar.gz"
      sha256 "1bc13d3c7bc47a8f1f3307f5a37cde398cc0a0a0900b55151a8c5ded0c8a8fc4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.18/diffr-0.1.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ef87a9a24dac0a3de7ccb4efd6a2d82712bbf8a0c5bee6854d65b50fe329c54e"
    end
    on_intel do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.18/diffr-0.1.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "242ed0805a44729bcea2c6d1153ec1454d1f3e20fe696239b8b94fd6f0bba9af"
    end
  end

  def install
    bin.install "diffr", "diffr-tui"
    doc.install "NOTICE"
    (pkgshare/"licenses").install "LICENSE"
    (pkgshare/"licenses/tui").install "packages/tui/LICENSE"
    (pkgshare/"licenses/themes").install "packages/viewer/themes/LICENSE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diffr --version")
    assert_match "theme", shell_output("#{bin}/diffr config schema")
    assert_predicate bin/"diffr-tui", :executable?
  end
end
