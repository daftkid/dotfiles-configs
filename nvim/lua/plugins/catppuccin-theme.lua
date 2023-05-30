local present, catppucin = pcall(require, "catppuccin")
if not present then
	print("catppuccin theme is not installed!")
	return
end

vim.opt.termguicolors = true
