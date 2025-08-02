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

require "config.plugins.colorscheme"
require "config.plugins.lsp-config"
require "config.plugins.mini"
require "config.plugins.oil"
require "config.plugins.treesitter"
require "config.plugins.typst-preview"
require "config.plugins.pear-tree"
require "config.plugins.gitsigns"
require "config.plugins.lualine"
require "config.plugins.conform"

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
    end,
})
vim.cmd("set completeopt+=noselect")

-- custom package
-- require "plugin.floatterm"
vim.keymap.set("n", "<C-\\>", ":Floaterminal<CR>")
