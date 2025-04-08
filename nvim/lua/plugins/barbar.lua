return {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,

    config = function()
      local plugin = require 'barbar'

      local config = {
        tabpages = true,
        animation = true,
        icons = {
          buffer_index = true,
          buffer_number = false,
          gitsigns = {
            added = {enabled = true, icon = '+'},
            changed = {enabled = true, icon = '~'},
            deleted = {enabled = true, icon = '-'},
          },
        },
      }

      plugin.setup(config)
    end,

}
