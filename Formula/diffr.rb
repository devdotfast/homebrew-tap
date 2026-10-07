class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/diffr"
  version "0.1.13"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.13/diffr-0.1.13-aarch64-apple-darwin.tar.gz"
      sha256 "a1aa54ce61070efb7331f1d1a7ecb15bd461ffe19a01b7db1555c45de2baa238"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.13/diffr-0.1.13-x86_64-apple-darwin.tar.gz"
      sha256 "6dee7a39c626b98f7e16a7cce536ba5e8752429a2a64ed1d8d7103627702bf2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.13/diffr-0.1.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "74eca5a233e0bab6b977bcb62f1a59dfd59702f077a07bd4a43271e2ef0026d9"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.13/diffr-0.1.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d3a3830562c2882df22c216a9ccc750567240e7f06db5772258c3ca191618d2"
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
