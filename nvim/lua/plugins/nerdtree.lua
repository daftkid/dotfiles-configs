vim.keymap.set("n", "<leader>t", ":NERDTreeToggle<cr>")
vim.keymap.set("n", "<leader>n", ":NERDTreeFocus<cr>")
vim.keymap.set("n", "<leader>f", ":NERDTreeFind<cr>")

vim.g.NERDTreeDirArrowExpandable = "▸"
vim.g.NERDTreeDirArrowCollapsible = "▾"
vim.g.NERDTreeShowHidden = 1

vim.cmd(
	[[ autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif ]]
)
-- vim.cmd [[ autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif ]]
