local map = vim.keymap.set

-- Перемещение выделенных строк
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Центрирование экрана
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Быстрые действия с буфером
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save buffer" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit buffer" })

-- DictorVim Smart Build & Execution Engine
local runner = require("dictorvim.util.runner")

-- Умный запуск: CMake / Make / Single-file C++20
map("n", "<leader>r", function()
  runner.run(false, false)
end, { desc = "Smart Build / Run (CMake, Make, or Single C++)" })

-- Запуск с AddressSanitizer
map("n", "<leader>rs", function()
  runner.run(true, false)
end, { desc = "Build / Run with ASan" })

-- Принудительный запуск одиночного файла (даже внутри CMake-проекта)
map("n", "<leader>rf", function()
  runner.run(false, true)
end, { desc = "Run Current File Only" })

-- Переключение Header/Source в C++
map("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<CR>", { desc = "Switch Header/Source" })

-- Бинарный HEX-режим
map("n", "<leader>hx", "<cmd>HexToggle<CR>", { desc = "Security: Toggle Hex View" })

-- Главный хаб
vim.api.nvim_create_user_command("Dictor", function()
  vim.cmd("Alpha")
end, { desc = "Open DictorVim Dashboard" })
