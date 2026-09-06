#!/usr/bin/env bash
set -euo pipefail

echo "=== DictorVim Installer ==="
echo "[*] Auditing system toolchain..."

# 1. Проверка Git
if ! command -v git &> /dev/null; then
    echo "[-] Fatal Error: 'git' is required to install DictorVim." >&2
    exit 1
fi

# 2. Проверка Neovim
if ! command -v nvim &> /dev/null; then
    echo "[-] Fatal Error: Neovim is not installed. Please install neovim >= 0.10.0." >&2
    exit 1
else
    NVIM_VER=$(nvim --version | head -n 1)
    echo "[+] Found Neovim: $NVIM_VER"
fi

# 3. Проверка C++ компилятора
if command -v g++ &> /dev/null; then
    echo "[+] Found C++ compiler: $(g++ --version | head -n 1)"
elif command -v clang++ &> /dev/null; then
    echo "[+] Found C++ compiler: $(clang++ --version | head -n 1)"
else
    echo "[!] Warning: Neither 'g++' nor 'clang++' was detected in PATH."
    echo "    The DictorRunner execution engine (<leader>r) will not function until a compiler is installed."
fi

# 4. Проверка clangd (LSP)
if command -v clangd &> /dev/null; then
    echo "[+] Found clangd LSP server: $(clangd --version | head -n 1)"
else
    echo "[!] Warning: 'clangd' not detected."
    echo "    Install 'clang' or 'clang-tools-extra' to enable C++ diagnostics and code completion."
fi

# 5. Процесс развертывания
TARGET_DIR="${HOME}/.config/dictorvim"
if [ -d "$TARGET_DIR" ]; then
    BACKUP="${TARGET_DIR}.backup.$(date +%s)"
    echo "[*] Existing configuration detected. Moving to $BACKUP"
    mv "$TARGET_DIR" "$BACKUP"
fi

echo "[*] Cloning DictorVim repository into $TARGET_DIR..."
git clone https://github.com/Dictor457/DictorVim.git "$TARGET_DIR"

echo ""
echo "[✓] DictorVim successfully installed and verified."
echo "====================================================="
echo "Launch isolated instance:"
echo "    NVIM_APPNAME=dictorvim nvim"
echo ""
echo "Recommended shell alias (add to ~/.zshrc or ~/.bashrc):"
echo "    alias dvim='NVIM_APPNAME=dictorvim nvim'"
echo "====================================================="
