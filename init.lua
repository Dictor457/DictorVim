-- DictorVim: High-Performance Environment for Systems Programmers
-- Entry point

if vim.fn.has("nvim-0.10") == 0 then
  vim.notify("DictorVim требует Neovim версии 0.10 или новее.", vim.log.levels.ERROR)
  return
end

require("dictorvim.core")
