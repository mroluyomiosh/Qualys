#!/usr/bin/env bash
set -euo pipefail

VERSION="$1"

# Determine download URL for QScanner tarball\ nif [[ "$VERSION" == "latest" ]]; then
  URL="https://example.com/qscanner/linux/amd64/qscanner.tar.gz"
else
  URL="https://example.com/qscanner/linux/amd64/qscanner-${VERSION}.tar.gz"
fi

# Download tarball
curl -sSL "$URL" -o qscanner.tar.gz

# Extract and install
mkdir -p qscanner_tmp
tar -xzf qscanner.tar.gz -C qscanner_tmp
chmod +x qscanner_tmp/qscanner
sudo mv qscanner_tmp/qscanner /usr/local/bin/qscanner

# Cleanup\ nrm -rf qscanner.tar.gz qscanner_tmp