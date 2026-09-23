class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/diffr"
  version "0.1.3"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/devdotfast/diffr/releases/download/0.1.3/diffr-0.1.3-aarch64-apple-darwin.tar.gz"
    sha256 "f4a8ab41893d7a670de7457cfa0090ea9367bdc585500b600e1b692eca216dbe"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/devdotfast/diffr/releases/download/0.1.3/diffr-0.1.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2bbdc89ffbcd5356c0527cf97e58169ffd9d940db3e518715e24d6cc11f5d4ff"
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
