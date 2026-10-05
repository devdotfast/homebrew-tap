# dev.fast Homebrew tap

Install Whiteboard (macOS):

```sh
brew install --cask devdotfast/tap/whiteboard
brew install --cask devdotfast/tap/whiteboard@preview
```

Whiteboard updates itself, so `brew upgrade` skips it. If you installed it from
the disk image, add `--adopt` to take over the existing app.

Install diffr, including its interactive terminal frontend:

```sh
brew install devdotfast/tap/diffr
```

Supports Apple Silicon macOS and x86-64 Linux. Rust and Bun are not required.

```sh
brew update
brew upgrade devdotfast/tap/diffr
brew uninstall devdotfast/tap/diffr
```

The update workflow checks the latest public diffr release hourly. It installs and
tests the release formula before committing it. Maintainers can also run the
workflow manually. Only the tap's built-in GitHub token is needed.

The Whiteboard workflow reads the live update feed hourly, then audits, installs,
and uninstalls each cask before committing it.
