-- Set options
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.o.winborder = "rounded"

-- Set cursor
vim.o.guicursor = ""

-- Set Leader key
vim.g.mapleader = " "

-- Keymaps
vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<C-d>", "<C-d>zz")
vim.keymap.set("v", "<C-u>", "<C-u>zz")
vim.keymap.set("i", "<C-H>", "<C-W>") -- use ctrl+backspace to delete the whole word
-- vim.keymap.set("n", "<leader>n", ":Ex<CR>")

vim.pack.add({
    { src = "https://github.com/vague2k/vague.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/chomosuke/typst-preview.nvim" },
    { src = "https://github.com/tmsvg/pear-tree" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end

        if client:supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = args.buf,
                callback = function()
                    require("conform").format({ bufnr = args.buf })
                    -- vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end
            })
        end
    end,
})
vim.cmd("set completeopt+=noselect")


-- colorscheme
require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")

-- Lsp config
vim.lsp.enable({
    "lua_ls",
    "gopls",
    "html",
    "pylsp",
    "harper_ls",
})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- go language server
vim.lsp.config("gopls", {
    capabilities = capabilities,
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

-- html language server
vim.lsp.config("html", {
    capabilities = capabilities,
    filetypes = { "html", "templ", "tmpl" },
})

-- harper config
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

-- Vim Status line
vim.cmd("hi statusline guibg=NONE")

-- Mini pick
require "mini.pick".setup()
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")

-- Oil
require "oil".setup()
vim.keymap.set("n", "<leader>n", ":Oil<CR>")

-- conform.nvim
require "conform".setup({
    formatters_by_ft = {
        lua = { "stylua" },
        -- installed these using `go install`
        go = { "gofmtpt", "goimports-reviser", "golines" }
    },
})

-- Treesitter
require "nvim-treesitter.configs".setup({
    ensure_installed = { "go", "lua" },
    highlight = { enable = true }
})

-- Gitsigns
require "gitsigns".setup()

-- Lualine
require "lualine".setup({
    options = {
        theme = "dracula"
    }
})
