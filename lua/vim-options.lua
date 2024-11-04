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

-- Keymap for terminal navigation
vim.keymap.set("n", "<F6>", ":let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>:vsplit term://below<CR>", {})

-- Normal Mode: Clear internal buffer in terminal
vim.api.nvim_set_keymap(
	"n",
	"<C-w><C-l>",
	":set scrollback=1 | sleep 100m | set scrollback=10000<CR>",
	{ noremap = true, silent = true }
)

-- Terminal Mode: Clear internal buffer and return to terminal insert mode
vim.api.nvim_set_keymap("t", "<C-w><C-l>", "<C-\\><C-n><C-w><C-l>i<C-l>", { noremap = true, silent = true })
