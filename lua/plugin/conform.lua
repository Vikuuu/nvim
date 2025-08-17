vim.pack.add({
    "https://github.com/stevearc/conform.nvim"
})

require "conform".setup({
    formatters_by_ft = {
        lua = { "stylua" },
        -- installed these using `go install`
        go = { "gofumpt", "goimports-reviser", "golines" },
        html = { "prettier" },
        template = { "prettier" },
    },
    format_on_save = {
        async = false,
        timeout_ms = 500,
        lsp_fallback = true,
    },
})
