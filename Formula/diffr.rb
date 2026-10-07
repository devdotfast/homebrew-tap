class Diffr < Formula
  desc "Structural diffs with an interactive terminal frontend"
  homepage "https://github.com/devdotfast/diffr"
  version "0.1.16"
  license all_of: ["MIT", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.16/diffr-0.1.16-aarch64-apple-darwin.tar.gz"
      sha256 "151188635ca8b72baddd78ac27bcd2e2e3d46fda79746a4748a468f7b2e9da04"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.16/diffr-0.1.16-x86_64-apple-darwin.tar.gz"
      sha256 "a4dae6d1793b9862dfe5a3468104f0dc2f66b7fd57a38972fca978450a748fc5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.16/diffr-0.1.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "198a9556e26b74a687586c39d3c370e9de9ad97fda9af8450bb0cab316621593"
    end
    on_intel do
      url "https://github.com/devdotfast/diffr/releases/download/0.1.16/diffr-0.1.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2d6a99e2fe2eea587d68d4929710b8a136beda71c0a0f05ae29b174aef4d9389"
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
