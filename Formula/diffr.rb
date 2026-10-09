class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/whiteboard/tree/main/diffr"
  version "0.1.19"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.19/diffr-0.1.19-aarch64-apple-darwin.tar.gz"
      sha256 "6289c7ac043f679271a08a1626d6c290c5fbc4f454c281e1443ac4fe3edc8e46"
    end
    on_intel do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.19/diffr-0.1.19-x86_64-apple-darwin.tar.gz"
      sha256 "6e8f2b63c577f20e5156e2de506c77998b26198fad377bc677cb9abd24e1e517"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.19/diffr-0.1.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "92d9af29fdad1e0840fd348ef3c1b7ad676953c89c0a8d096b378875a0c557c9"
    end
    on_intel do
      url "https://github.com/devdotfast/whiteboard/releases/download/diffr%2F0.1.19/diffr-0.1.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "05f34ceec0c346febb2575914718c8b0bc85e22a4a7c3cbe6b0e28ce0b4b635b"
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
