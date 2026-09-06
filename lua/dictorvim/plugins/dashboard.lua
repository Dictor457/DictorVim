return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Фирменный изометрический логотип DICTORVIM
      dashboard.section.header.val = {
        [[  ____  ___ ____ _____ ___  ______     _____ __  __ ]],
        [[ |  _ \|_ _/ ___|_   _/ _ \|  _ \ \   / /_ _|  \/  |]],
        [[ | | | || | |     | || | | | |_) \ \ / / | || |\/| |]],
        [[ | |_| || | |___  | || |_| |  _ < \ V /  | || |  | |]],
        [[ |____/|___\____| |_| \___/|_| \_\ \_/  |___|_|  |_|]],
      }
      dashboard.section.header.opts.hl = "Keyword"

      -- Только необходимые кнопки без визуального мусора
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
        dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
        dashboard.button("s", "  Live Grep", ":Telescope live_grep<CR>"),
        dashboard.button("n", "  New File", ":ene <BAR> startinsert<CR>"),
        dashboard.button("u", "  Sync Core", ":Lazy sync<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }

      -- Лаконичный статус загрузки
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = {
            "",
            "DictorVim Core :: " .. stats.loaded .. "/" .. stats.count .. " modules :: " .. ms .. "ms",
          }
          pcall(vim.cmd.AlphaRedraw)
        end,
      })

      dashboard.opts.layout[1].val = 6
      alpha.setup(dashboard.opts)
    end,
  },
}
