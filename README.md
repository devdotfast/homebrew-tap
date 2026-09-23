# dev.fast Homebrew tap

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
