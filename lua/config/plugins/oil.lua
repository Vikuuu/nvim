vim.pack.add({
    "https://github.com/stevearc/oil.nvim"
})

require "oil".setup()
vim.keymap.set("n", "<leader>n", ":Oil<CR>")
