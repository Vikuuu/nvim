-- Set Leader key
vim.g.mapleader = " "

-- Set cursor
vim.o.guicursor = ""

-- Print an ascii art on opening
vim.cmd(":echo '>^.^<'")

-- Set options
vim.o.winborder = "rounded"
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false

-- Keymaps
vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<C-d>", "<C-d>zz")
vim.keymap.set("v", "<C-u>", "<C-u>zz")
-- use ctrl+backspace to delete the whole word
vim.keymap.set("i", "<C-H>", "<C-W>")
vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>")
-- uppercase the whole word backwords
vim.keymap.set("i", "<C-u>", "<esc>vbUea")

require "plugin.colorscheme"
require "plugin.conform"
require "plugin.gitsigns"
require "plugin.lsp-config"
require "plugin.lualine"
require "plugin.mini"
require "plugin.oil"
require "plugin.pear-tree"
require "plugin.treesitter"
require "plugin.typst-preview"

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
