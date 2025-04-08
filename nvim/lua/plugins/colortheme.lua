return {
  "catppuccin/nvim",
  name = "catppuccin", 
  lazy = false,
  priority = 1000,
  config = function()
    local plugin = require 'catppuccin'
    local config = {
      transparent_background = true
    }
    plugin.setup(config)
    vim.cmd("colorscheme catppuccin-macchiato")

    -- Make the background of diagnostics messages transparent
    local set_diagnostics_bg_transparency = function()
      vim.cmd [[highlight DiagnosticVirtualTextError guibg=none]]
      vim.cmd [[highlight DiagnosticVirtualTextWarn guibg=none]]
      vim.cmd [[highlight DiagnosticVirtualTextInfo guibg=none]]
      vim.cmd [[highlight DiagnosticVirtualTextHint guibg=none]]
    end
    set_diagnostics_bg_transparency()

    -- Toggle background transparency
    local toggle_transparency = function()
      config.transparent_background = not config.transparent_background
      plugin.setup(config)
      -- vim.cmd.colorscheme "catppuccin"
      vim.cmd("colorscheme catppuccin-macchiato")
      set_diagnostics_bg_transparency()
    end

    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end,
}
