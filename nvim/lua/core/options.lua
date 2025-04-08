vim.o.number = true
vim.wo.relativenumber = true
vim.o.linebreak = true
vim.o.wrap = false
vim.o.mouse = 'a'
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.updatetime = 100
vim.wo.signcolumn = 'yes'
vim.opt.termguicolors = true
vim.o.scrolloff = 4
vim.o.sidescrolloff = 8
vim.o.cursorline = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.smartindent = true
vim.opt.colorcolumn = "120"
vim.opt.textwidth = 120
vim.opt.foldmethod = "syntax"
vim.opt.foldlevelstart = 1
vim.o.showmode = false

vim.cmd.syntax("on")
vim.cmd("filetype plugin indent on")
vim.cmd([[hi Normal guibg=None ctermbg=None]])
vim.cmd("autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab")
vim.cmd("autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab")

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.opt.confirm = true
