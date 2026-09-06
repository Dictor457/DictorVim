return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { [[<C-/>]], desc = "Toggle Terminal (Bottom)" },
      { [[<C-_>]], desc = "Toggle Terminal (Bottom)" },
    },
    opts = {
      size = 15, -- Высота терминала снизу (15 строк)
      open_mapping = [[<c-_>]], -- В Kitty Ctrl+/ посылает код <C-_>
      direction = "horizontal",
      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
      close_on_exit = true,
      shell = vim.o.shell,
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- Дублируем бинд для надежности на обоих представлениях клавиши
      local map = vim.keymap.set
      map({ "n", "t", "i" }, "<C-/>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
      map({ "n", "t", "i" }, "<C-_>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
    end,
  },
}
