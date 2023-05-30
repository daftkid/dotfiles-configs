local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
	print("treesitter is not installed!")
	return
end

treesitter.setup({
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

	highlight = { enable = true },
	indent = { enable = true, disable = { "python" } },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<c-s>",
			node_incremental = "<c-s>",
		},
	},
})
