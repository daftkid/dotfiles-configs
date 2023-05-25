vim.g.syntastic_always_populate_loc_list = 1
vim.g.syntastic_auto_loc_list = 1
vim.g.syntastic_check_on_open = 1
vim.g.syntastic_check_on_wq = 0
vim.g.syntastic_go_checkers = { "gofmt" }

vim.opt.statusline:append("%#warningmsg#")
vim.opt.statusline:append("%{SyntasticStatuslineFlag()}")
vim.opt.statusline:append("%*")
