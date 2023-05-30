local setup, lualine = pcall(require, "lualine")
if not setup then
	print("lualine is not installed!")
	return
end

lualine.setup({
	options = {
		theme = "auto",
	},

	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
			"diagnostics",
		},
		lualine_c = { "filename" },
		lualine_x = { "encoding", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	extensions = {
		"nerdtree",
		"lazy",
	},
})
