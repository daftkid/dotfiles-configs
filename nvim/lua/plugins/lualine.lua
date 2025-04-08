return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "bwpge/lualine-pretty-path",
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      local config = {
        options = {
          theme = "auto",
          disabled_filetypes = {'neo-tree'},
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            "branch",
            "diff",
            "diagnostics",
          },
          lualine_c = { "pretty_path" },

          lualine_x = {
            -- "encoding",
            "filetype",
            {
              require("noice").api.statusline.mode.get,
              cond = require("noice").api.statusline.mode.has,
              color = { fg = "#ff9e64" },
            },
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        extensions = {
          "neo-tree",
          "mason",
          "quickfix",
          "lazy",
        },

      }

      local lualine = require 'lualine'
      lualine.setup(config)
    end,
}
