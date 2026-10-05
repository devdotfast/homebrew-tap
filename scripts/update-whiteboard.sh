#!/usr/bin/env bash
# Usage: scripts/update-whiteboard.sh stable|preview
set -euo pipefail

case "$1" in
  stable) cask=Casks/whiteboard.rb bundle=Whiteboard ;;
  preview) cask=Casks/whiteboard@preview.rb bundle=Whiteboard%20Preview ;;
  *) echo "unknown channel: $1" >&2; exit 2 ;;
esac

feed() {
  curl -fsS "https://update.dev.fast/api/update/$1/$2/0000000?bundle=$bundle"
}

arm=$(feed darwin-arm64 "$1")
intel=$(feed darwin "$1")
version=$(jq -r .productVersion <<<"$arm")

if [ "$version" != "$(jq -r .productVersion <<<"$intel")" ]; then
  echo "Feeds disagree on the $1 version; a release is mid-upload."
  exit 0
fi

for target in arm64:"$arm" x64:"$intel"; do
  expected="https://update.dev.fast/releases/$version/darwin-${target%%:*}/Whiteboard-darwin-${target%%:*}-$version.zip"
  actual=$(jq -r .url <<<"${target#*:}")
  if [ "$actual" != "$expected" ]; then
    echo "Unexpected payload URL $actual (wanted $expected)" >&2
    exit 1
  fi
done

sed -i.bak -E \
  -e "s/^(  version )\"[^\"]+\"/\1\"$version\"/" \
  -e "s/^(  sha256 arm: +)\"[0-9a-f]+\"/\1\"$(jq -r .sha256hash <<<"$arm")\"/" \
  -e "s/^( +intel: )\"[0-9a-f]+\"/\1\"$(jq -r .sha256hash <<<"$intel")\"/" \
  "$cask"
rm "$cask.bak"
