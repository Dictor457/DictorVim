# DictorVim

A high-performance, minimalist Neovim configuration framework optimized for modern C++, systems programming, and security auditing.

Built directly on the native Neovim 0.12 API without legacy wrapper overhead.

---

## Overview

DictorVim is designed specifically for engineers who require an instant, low-latency editing environment with first-class tooling for low-level development. Unlike general-purpose distributions, DictorVim excludes web-development bloat and focuses entirely on compilation speed, diagnostic accuracy, and memory debugging.

### Key Characteristics

- Sub-20ms Boot Time: Zero-cost startup architecture via strict event-driven deferred loading.
- Native Neovim 0.12 Architecture: Full adoption of native vim.lsp.config, vim.lsp.enable, and built-in Tree-sitter integration.
- Integrated C++ Execution Engine: Automated compilation (g++ -O3 -std=c++20) and microsecond runtime measurement.
- Memory Safety & Hardening: Built-in triggers for AddressSanitizer (-fsanitize=address,undefined) to detect buffer overflows and memory corruptions instantly.
- Binary Inspection: Native toggleable hexadecimal editor for ELF files and shellcode analysis.
- Non-Invasive Installation: Runs fully isolated via NVIM_APPNAME=dictorvim without modifying your default ~/.config/nvim.

---

## Visual Preview

<p align="center">
  <img src="assets/preview.png" alt="DictorVim Interface" width="90%">
</p>

---

## Installation

### Automated Installation

Run via terminal:
curl -fsSL https://raw.githubusercontent.com/dictor457/DictorVim/main/install.sh | bash

### Manual Installation

Clone the repository to an isolated configuration directory:
git clone https://github.com/dictor457/DictorVim.git ~/.config/dictorvim

Launch DictorVim:
NVIM_APPNAME=dictorvim nvim

Optional shell alias for ~/.zshrc or ~/.bashrc:
alias dvim="NVIM_APPNAME=dictorvim nvim"

---

## System Requirements

- Neovim: >= 0.10.0 (Recommended: 0.12+)
- Compilers & Tooling: gcc, clang, clang-tools-extra
- Environment: Linux/Wayland, Nerd Font compatible terminal (e.g., Kitty)
- Utilities: git, curl

---

## Keybindings Reference

All custom actions use <Space> as the leader key.

### C++ Development & Execution

| Binding | Mode | Description |
| :--- | :--- | :--- |
| <leader>r | Normal | Compile C++ source (-O3 -std=c++20) and execute with runtime benchmark |
| <leader>rs | Normal | Compile and run with AddressSanitizer / UBSan |
| <leader>ch | Normal | Switch between Header and Source implementation via clangd |
| K | Normal | Display LSP hover documentation |
| gd | Normal | Jump to symbol definition |
| <leader>rn | Normal | Symbol rename |
| <leader>ca | Normal | Code actions |

### Diagnostics & Tooling

| Binding | Mode | Description |
| :--- | :--- | :--- |
| <leader>xx | Normal | Toggle project-wide diagnostics panel (Trouble) |
| <leader>hx | Normal | Toggle binary hexadecimal editor |
| <C-/> / <C-_> | Normal / Term / Insert | Toggle persistent bottom terminal split |

### Navigation & Core

| Binding | Mode | Description |
| :--- | :--- | :--- |
| <leader>f | Normal | Find files (Telescope) |
| <leader>s | Normal | Live text search across project |
| <leader>w | Normal | Write current buffer |
| <leader>q | Normal | Close current buffer / window |
| :Dictor | Command | Open central dashboard |

---

## License

Open-source under the MIT License. Developed and maintained by [Dictor](https://github.com/dictor457).
