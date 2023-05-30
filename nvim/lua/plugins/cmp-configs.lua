vim.opt.completeopt = "menu,menuone,noselect"

local present, cmp = pcall(require, "cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-l>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" }, -- For vsnip users.
	}, {
		{ name = "buffer" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end

require("lspconfig")["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "go", "gomod" },
	settings = {
		gopls = {
			analyses = {
				assign = true,
				atomic = true,
				bools = true,
				composites = true,
				copylocks = true,
				deepequalerrors = true,
				embed = true,
				errorsas = true,
				fieldalignment = true,
				httpresponse = true,
				ifaceassert = true,
				loopclosure = true,
				lostcancel = true,
				nilfunc = true,
				nilness = true,
				nonewvars = true,
				printf = true,
				shadow = true,
				shift = true,
				simplifycompositelit = true,
				simplifyrange = true,
				simplifyslice = true,
				sortslice = true,
				stdmethods = true,
				stringintconv = true,
				structtag = true,
				testinggoroutine = true,
				tests = true,
				timeformat = true,
				unmarshal = true,
				unreachable = true,
				unsafeptr = true,
				unusedparams = true,
				unusedresult = true,
				unusedvariable = true,
				unusedwrite = true,
				useany = true,
			},
			hoverKind = "FullDocumentation",
			linkTarget = "pkg.go.dev",
			usePlaceholders = true,
			vulncheck = "Imports",
		},
	},
})

require("lspconfig")["pyright"].setup({})
require("lspconfig")["terraformls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").tflint.setup({})
require("lspconfig").vimls.setup({})
