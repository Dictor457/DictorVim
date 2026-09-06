return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        transparent = false,
        italic_comments = true,
      })
      vim.cmd.colorscheme("cyberdream")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      -- Хелпер: выводит имя активного LSP-сервера
      local function lsp_status()
        local msg = "No LSP"
        local buf_ft = vim.bo.filetype
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        if next(clients) == nil then
          return msg
        end
        local client_names = {}
        for _, client in pairs(clients) do
          table.insert(client_names, client.name)
        end
        return "󰌘 " .. table.concat(client_names, ", ")
      end

      return {
        options = {
          theme = "cyberdream",
          icons_enabled = true,
          component_separators = "",
          section_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { lsp_status, "diagnostics", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
