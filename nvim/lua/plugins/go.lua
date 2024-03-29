vim.opt.autowrite = true

-- Go syntax highlighting
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.go.go_highlight_function_calls = 1
vim.go.go_highlight_extra_types = 1
vim.go.go_highlight_operators = 1

-- Autoformatting and importing
vim.g.go_fmt_autosave = 1
vim.g.go_fmt_command = "goimports"

-- Status line types/signatures
vim.g.go_auto_type_info = 1
