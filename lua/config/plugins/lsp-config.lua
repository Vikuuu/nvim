vim.pack.add(
    { "https://github.com/neovim/nvim-lspconfig" }
)


vim.lsp.enable({
    "lua_ls",
    "gopls",
    "html",
    "pylsp",
    "harper_ls",
})

-- go language server
vim.lsp.config("gopls", {
    -- capabilities = require("blink.cmp").get_lsp_capabilities(),
    cmd = { "gopls" },
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

-- HTML language server
vim.lsp.config("html", {
    -- capabilities = require("blink.cmp").get_lsp_capabilities(),
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

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format) -- file formatting
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
