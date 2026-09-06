local map = vim.keymap.set

-- Перемещение строк в визуальном режиме
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Переместить строку вниз" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Переместить строку вверх" })

-- Центрирование экрана
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Быстрые действия с буфером
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Сохранить файл" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Закрыть буфер" })

-- Кастомная команда вызова стартового хаба DictorVim
vim.api.nvim_create_user_command("Dictor", function()
  vim.cmd("Alpha")
end, { desc = "Открыть главный хаб DictorVim" })

-- DictorVim Killer Features for C++ & Security
local runner = require("dictorvim.util.runner")

-- Запуск C++ алгоритма с замером времени
vim.keymap.set("n", "<leader>r", function()
  runner.run_cpp(false)
end, { desc = "DictorRunner: Build & Execute C++" })

-- Запуск с AddressSanitizer (поиск переполнений буфера и UAF)
vim.keymap.set("n", "<leader>rs", function()
  runner.run_cpp(true)
end, { desc = "DictorSecurity: Build with ASan" })

-- Быстрое переключение Header <-> Source в C++ (через clangd)
vim.keymap.set("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<CR>", { desc = "Switch Header/Source" })

-- Переключение бинарного HEX-режима для анализа шеллкодов и ELF файлов
vim.keymap.set("n", "<leader>hx", "<cmd>HexToggle<CR>", { desc = "Security: Toggle Hex View" })
