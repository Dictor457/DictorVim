return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline_popup", -- Возвращаем плашку по центру
        format = {
          cmdline = { icon = "  " },
          search_down = { icon = "   " },
          search_up = { icon = "   " },
          filter = { icon = "  " },
          lua = { icon = "  " },
        },
      },
      popupmenu = {
        enabled = true,
        backend = "nui",
      },
      messages = { enabled = true },
      presets = {
        bottom_search = false,
        command_palette = true, -- Красивое центрированное позиционирование
        long_message_to_split = true,
      },
    },
  },
}
