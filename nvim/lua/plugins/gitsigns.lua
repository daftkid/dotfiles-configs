return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local plugin = require 'gitsigns'
    local config = {
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
      }
      plugin.setup(config)
  end,
}
