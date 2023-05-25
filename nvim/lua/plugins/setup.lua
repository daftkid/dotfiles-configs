local lazy = {}

lazy.path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
lazy.opts = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print("Installing lazy.nvim....")
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			path,
		})
	end
end

function lazy.setup(plugins)
	-- You can "comment out" the line below after lazy.nvim is installed
	lazy.install(lazy.path)

	vim.opt.rtp:prepend(lazy.path)
	require("lazy").setup(plugins, lazy.opts)
end

lazy.setup({
	-- syntax-related plugins (highlighters, checkers, etc.)
	{
		"vim-syntastic/syntastic",
		config = function()
			require("plugins.syntastic")
		end,
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Golang development plugins
	{
		"fatih/vim-go",
		build = ":GoUpdateBinaries",
		config = function()
			require("plugins.go")
		end,
	},

	-- Status line plugins
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.devicons")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("plugins.catppuccin-theme")
		end,
	},

	-- Terraform-related plugins
	{
		"hashivim/vim-terraform",
		config = function()
			require("plugins.terraform")
		end,
	},

	-- git tools and helpers
	{ "mhinz/vim-signify" },
	{ "tpope/vim-fugitive" },
	{ "itchyny/vim-gitbranch" },

	-- system helpers
	{ "christoomey/vim-system-copy" },

	-- Filesystem exploration
	{
		"preservim/nerdtree",
		config = function()
			require("plugins.nerdtree")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.telescope")
		end,
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"vim-ctrlspace/vim-ctrlspace",
	},

	-- Quick edits and cuts
	{ "tpope/vim-surround" },
	{ "tpope/vim-commentary" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{ "inkarkat/vim-ReplaceWithRegister" }, -- ???

	-- Autocompletion
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.cmp-configs")
		end,
	},

	---- js
	{ "mxw/vim-jsx" },
	{ "pangloss/vim-javascript" },

	---- readme preview
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			require("plugins.readme-preview")
		end,
	},
})
