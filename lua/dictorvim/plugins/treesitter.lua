return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      -- Инициализируем современный Treesitter без устаревшего модуля .configs
      pcall(function()
        require("nvim-treesitter").setup({})
      end)

      -- Включаем нативный движок подсветки Neovim 0.12 для системных языков
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp", "asm", "lua", "bash", "markdown" },
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
