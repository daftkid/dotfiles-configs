require 'core.options'
require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { "folke/which-key.nvim", opts = {} },
  { "tpope/vim-fugitive" },
  { "tpope/vim-commentary" },
  { "tpope/vim-repeat" },
  { "mxw/vim-jsx" },
  { "pangloss/vim-javascript" },
  { "christoomey/vim-system-copy" },
  { 'tpope/vim-sleuth' },

  require 'plugins.neotree',
  require 'plugins.colortheme',
  require 'plugins.barbar',
  require 'plugins.noice',
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.devicons',
  require 'plugins.terraform',
  require 'plugins.gitsigns',
  require 'plugins.surround',
  require 'plugins.syntastic',
  require 'plugins.autopairs',

})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
