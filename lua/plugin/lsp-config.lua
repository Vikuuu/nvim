vim.pack.add(
    { "https://github.com/neovim/nvim-lspconfig" }
)

vim.lsp.enable({
    "lua_ls",
    "gopls",
    "html",
    "pylsp",
    "harper_ls",
    "typescript-language-server",
    "vscode-langservers-extracted",
    "tailwindcss-intellisense",
    "astro",
})

-- go language server
vim.lsp.config("gopls", {
    -- cmd = { "gopls" },
    cmd = { "/home/viku/go/bin/gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
        },
    },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- HTML language server
vim.lsp.config("html", {
    capabilities = capabilities,
    filetypes = { "html", "templ", "tmpl" },
})

-- Harper config
vim.lsp.config("harper_ls", {
    filetypes = { "markdown", "tex" },
    settings = {
        ["harper-ls"] = {
            linters = {
                SentenceCapitalization = false,
                SpellCheck = false,
            },
        },
    },
})

vim.lsp.config("tailwindcss-intellisense", {})
vim.lsp.config("typescript-language-server", {})
vim.lsp.config("vscode-langservers-extracted", {})
vim.lsp.config("astro", {})

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format) -- file formatting
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
