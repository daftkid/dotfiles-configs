local mason_lspconfig = require("mason-lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { silent = true, noremap = true, buffer = bufnr, desc = desc })
  end

  nmap("<space>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  nmap("<space>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  -- nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
  nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  nmap("<space>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  nmap("<space>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  nmap("<space>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

  -- See `:help K` for why this keymap
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders")

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })
end

local servers = {
  pyright = {},
  terraformls = {},
  jsonls = {},
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
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    })
  end,
})
