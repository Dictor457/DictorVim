#!/usr/bin/env bash
set -e

TARGET_DIR="$HOME/.config/dictorvim"

echo "Installing DictorVim..."

if [ -d "$TARGET_DIR" ]; then
    BACKUP="${TARGET_DIR}.backup.$(date +%s)"
    echo "Existing configuration found. Moving to ${BACKUP}"
    mv "$TARGET_DIR" "$BACKUP"
fi

git clone https://github.com/dictor457/DictorVim.git "$TARGET_DIR"

echo "DictorVim installed successfully."
echo "Usage: NVIM_APPNAME=dictorvim nvim"
echo "Recommended alias: alias dvim='NVIM_APPNAME=dictorvim nvim'"
