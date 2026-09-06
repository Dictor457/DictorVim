local M = {}

function M.setup()
  vim.g.mapleader = " "
  vim.g.maplocalleader = "\\"

  require("dictorvim.core.options")
  require("dictorvim.core.lazy")
  require("dictorvim.core.keymaps")
  require("dictorvim.core.autocmds")
end

M.setup()

return M
