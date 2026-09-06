local opt = vim.opt

-- Навигация и номера строк
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8

-- Табуляция (стандарт 4 пробела для системного C++)
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true

-- Поиск
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Тайминги и скорость UI
opt.updatetime = 50
opt.timeoutlen = 300
opt.termguicolors = true

-- Wayland clipboard (wl-copy)
opt.clipboard = "unnamedplus"

-- Надежность: персистентная история изменений вместо мусорных swap-файлов
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"
