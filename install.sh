#!/usr/bin/env bash
set -e

REPO="nick-popovic/Custom-Update"

# Use ~/.local/bin as the standard user binary directory
DEFAULT_DIR="$HOME/.local/bin"
INSTALL_DIR="${1:-$DEFAULT_DIR}"

BIN_URL="https://github.com/$REPO/releases/latest/download/update"
CHECKSUM_URL="https://github.com/$REPO/releases/latest/download/update.sha256"

echo "Downloading update from latest release..."
TMP_DIR=$(mktemp -d)
cd "$TMP_DIR"

if ! curl -sLf "$BIN_URL" -o update; then
    echo "Error: Failed to download update. Make sure a release exists."
    cd - >/dev/null
    rm -rf "$TMP_DIR"
    exit 1
fi

echo "Downloading checksum file..."
if ! curl -sLf "$CHECKSUM_URL" -o update.sha256; then
    echo "Error: Failed to download checksum file."
    cd - >/dev/null
    rm -rf "$TMP_DIR"
    exit 1
fi

echo "Verifying checksum..."
# Check if sha256sum is available
if ! command -v sha256sum >/dev/null 2>&1; then
    # Fallback to shasum on macOS if sha256sum is not available
    if command -v shasum >/dev/null 2>&1; then
        if ! shasum -a 256 -c update.sha256 >/dev/null 2>&1; then
            echo "Error: Checksum verification failed!"
            cd - >/dev/null
            rm -rf "$TMP_DIR"
            exit 1
        fi
        echo "Checksum verified successfully."
    else
        echo "Warning: Neither sha256sum nor shasum found."
        echo "We cannot securely verify the downloaded binary."
        # Read from /dev/tty so this works even if the script is piped to bash
        read -p "Do you want to continue installation anyway? [y/N] " -r REPLY < /dev/tty || true
        if [[ ! "$REPLY" =~ ^[Yy]$ ]]; then
            echo "Installation aborted."
            cd - >/dev/null
            rm -rf "$TMP_DIR"
            exit 1
        fi
    fi
else
    if ! sha256sum -c update.sha256 >/dev/null 2>&1; then
        echo "Error: Checksum verification failed!"
        cd - >/dev/null
        rm -rf "$TMP_DIR"
        exit 1
    fi
    echo "Checksum verified successfully."
fi

# Ensure installation directory exists
mkdir -p "$INSTALL_DIR"

# Move the binary and make it executable as 'update'
mv update "$INSTALL_DIR/update"
chmod +x "$INSTALL_DIR/update"

# Clean up
cd - >/dev/null
rm -rf "$TMP_DIR"

echo "======================================================="
echo " Successfully installed update to:"
echo "   $INSTALL_DIR/update"
echo "======================================================="

# Check if the install directory is in the user's PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo ""
    echo " Note: $INSTALL_DIR is not in your PATH."
    echo " You may need to add the following line to your ~/.bashrc or ~/.zshrc:"
    echo "   export PATH=\"\$PATH:$INSTALL_DIR\""
    echo ""
fi
