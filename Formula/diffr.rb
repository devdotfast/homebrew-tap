class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/whiteboard/tree/main/diffr"
  version "0.1.23"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.23/diffr-0.1.23-aarch64-apple-darwin.tar.gz"
      sha256 "082936b1298b7be4874f4944a1344ea426170a92ff0bdbaebeb7daec787b9600"
    end
    on_intel do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.23/diffr-0.1.23-x86_64-apple-darwin.tar.gz"
      sha256 "782a73fc4abe7e15e54bfb5603dfa5798f11f5f9191a71bc6a7c7454cf55b3db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.23/diffr-0.1.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf037748402e04406a2b66d5ede04fa05cfc85cedd0baa5e34aae5fe085edc0a"
    end
    on_intel do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.23/diffr-0.1.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d26b17ecb48182cc76e10a7c8430a19ec07a7f6dce0c86847d8af89d637c5ab"
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
