-- vim-options.lua

-- Set options
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set nopaste")

-- Set leader key
vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keymap for terminal navigation
vim.keymap.set("n", "<F6>", ":let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>:vsplit term://below<CR>", {})
vim.keymap.set("n", "<leader>n", ":Ex<CR>")

-- Normal Mode: Clear internal buffer in terminal
vim.api.nvim_set_keymap(
	"n",
	"<C-w><C-l>",
	":set scrollback=1 | sleep 100m | set scrollback=10000<CR>",
	{ noremap = true, silent = true }
)

-- Terminal Mode: Clear internal buffer and return to terminal insert mode
vim.api.nvim_set_keymap("t", "<C-w><C-l>", "<C-\\><C-n><C-w><C-l>i<C-l>", { noremap = true, silent = true })

-- Nvim cursor setting
-- vim.cmd("set guicursor=i-ci-ve:ver10,i-ci-ve:hor35") -- underscore for cursor
-- vim.cmd("set guicursor=i-ci-ve:ver10,i-ci-ve:hor35-blinkwait5-blinkoff5-blinkon5")
-- vim.cmd("set guicursor=n-v-c:ver10,n-v-c:hor35-blinkwait5-blinkoff5-blinkon5")
