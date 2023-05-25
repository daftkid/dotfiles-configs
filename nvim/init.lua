-- Init file for NVim config
require("keys")
require("defaults")
require("plugins.setup")
-- for some reason when I'm doing the same command with Lazy config, it is flacky from time to time and not started properly
-- so I need to define it here
require("bufferline").setup({})

vim.cmd.syntax("on")
vim.cmd([[hi Normal guibg=None ctermbg=None]])
vim.cmd("filetype plugin indent on")
vim.cmd("colorscheme catppuccin-frappe")
