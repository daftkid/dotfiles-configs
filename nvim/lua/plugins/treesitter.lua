return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = {
      ensure_installed = {
        "c",
        "comment",
        "css",
        "dockerfile",
        "dot",
        "gitcommit",
        "gitignore",
        "go",
        "hcl",
        "html",
        "json",
        "lua",
        "python",
        "terraform",
        "tsx",
        "typescript",
        "yaml",
        "vimdoc",
        "vim",
      },
      -- Autoinstall languages that are not installed
      auto_install = true,

      highlight = { enable = true },
      indent = { enable = true, disable = { "python" } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-s>",
          node_incremental = "<c-s>",
        },
      },
    }
    local treesitter = require 'nvim-treesitter.configs'
    treesitter.setup(config)
    vim.filetype.add { extension = { tf = 'terraform' } }
    vim.filetype.add { extension = { tfvars = 'terraform' } }
  end,
}
