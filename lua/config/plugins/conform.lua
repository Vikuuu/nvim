vim.pack.add({
    "https://github.com/stevearc/conform.nvim"
})

require "conform".setup({
    formatters_by_ft = {
        lua = { "stylua" },
        -- installed these using `go install`
        go = { "gofmtpt", "goimports-reviser", "golines" }
    },
    format_on_save = {
        async = false,
        timeout_ms = 500,
        lsp_fallback = true,
    },
})
