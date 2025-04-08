return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("plugins.mason")
      end,
    },
    {
      'j-hui/fidget.nvim',
      tag = 'v1.4.0',
      opts = {
        progress = {
          display = {
            done_icon = '✓', -- Icon shown when all LSP progress tasks are complete
          },
        },
        notification = {
          window = {
            winblend = 0, -- Background color opacity in the notification window
          },
        },
      },
    },

    "folke/neodev.nvim",
  }
}
