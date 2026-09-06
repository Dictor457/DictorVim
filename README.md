# DictorVim

A high-performance, minimalist Neovim distribution engineered for modern C++, systems programming, and security auditing.

Built directly on the native Neovim 0.12 API without legacy wrapper overhead.

[![CI Smoke Test](https://github.com/Dictor457/DictorVim/actions/workflows/ci.yml/badge.svg)](https://github.com/Dictor457/DictorVim/actions/workflows/ci.yml)

---

## Overview

DictorVim is designed specifically for engineers who require an instant, low-latency editing environment with first-class tooling for low-level development. Rather than being a bloated general-purpose bundle, DictorVim excludes unnecessary web-stack layers and focuses strictly on compilation speed, diagnostic accuracy, and memory safety.

### Key Characteristics

- Sub-20ms Boot Time: Zero-cost startup architecture via strict event-driven deferred loading.
- Native Neovim 0.12 Architecture: Full adoption of native `vim.lsp.config`, `vim.lsp.enable`, and built-in Tree-sitter integration.
- Toolchain Sanity Checks: Automatic environment verification for compilers and diagnostic servers.
- Integrated C++ Execution Engine: Automated compilation (`g++ -O3 -std=c++20`) and microsecond runtime measurement.
- Memory Safety & Hardening: Built-in triggers for AddressSanitizer (`-fsanitize=address,undefined`) to detect buffer overflows and memory corruptions instantly.
- Binary Inspection: Native toggleable hexadecimal editor for ELF files and shellcode analysis.
- Non-Invasive Installation: Runs fully isolated via `NVIM_APPNAME=dictorvim` without modifying your default `~/.config/nvim`.

---

## Visual Preview

### Core Dashboard (<18ms boot)
<p align="center">
  <img src="assets/dashboard.png" alt="DictorVim Dashboard" width="90%">
</p>

### C++ Workflow & Integrated Terminal
<p align="center">
  <img src="assets/workflow.png" alt="DictorVim C++ Workflow" width="90%">
</p>

---

## Installation

### Recommended Method (Audited Git Clone)

Inspect and clone the repository directly to maintain full control over your environment:

```bash
git clone https://github.com/Dictor457/DictorVim.git ~/.config/dictorvim
```

Run DictorVim in isolated mode:

```bash
NVIM_APPNAME=dictorvim nvim
```

*(Optional) Configure an alias in your shell configuration (`~/.zshrc` or `~/.bashrc`):*

```bash
alias dvim="NVIM_APPNAME=dictorvim nvim"
```

---

## System Requirements & Toolchain

To utilize the full low-level toolchain, ensure the following packages are present on your system:

- **Editor:** Neovim `>= 0.10.0` (Recommended: `0.12+`)
- **Compilers:** `gcc` / `g++` (C++20 support)
- **LSP & Formatting:** `clang` / `clangd`, `clang-tools-extra`
- **Profiling (Optional):** GNU `time` (`/usr/bin/time`)
- **Terminal:** Linux/Wayland, Nerd Font compatible terminal (e.g., Kitty)

---

## Keybindings Reference

All custom actions use `<Space>` as the leader key.

### C++ Development & Execution

| Binding | Mode | Description |
| :--- | :--- | :--- |
| `<leader>r` | Normal | Compile C++ source (`-O3 -std=c++20`) and execute with runtime benchmark |
| `<leader>rs` | Normal | Compile and run with AddressSanitizer / UBSan |
| `<leader>ch` | Normal | Switch between Header and Source implementation via clangd |
| `K` | Normal | Display LSP hover documentation |
| `gd` | Normal | Jump to symbol definition |
| `<leader>rn` | Normal | Symbol rename |
| `<leader>ca` | Normal | Code actions |

### Diagnostics & Tooling

| Binding | Mode | Description |
| :--- | :--- | :--- |
| `<leader>xx` | Normal | Toggle project-wide diagnostics panel (Trouble) |
| `<leader>hx` | Normal | Toggle binary hexadecimal editor |
| `<C-/>` / `<C-_>` | Normal / Term / Insert | Toggle persistent bottom terminal split |

### Navigation & Core

| Binding | Mode | Description |
| :--- | :--- | :--- |
| `<leader>f` | Normal | Find files (Telescope) |
| `<leader>s` | Normal | Live text search across project |
| `<leader>w` | Normal | Write current buffer |
| `<leader>q` | Normal | Close current buffer / window |
| `:Dictor` | Command | Open central dashboard |

---

## License

Open-source under the MIT License. Developed and maintained by [Dictor](https://github.com/dictor457).
