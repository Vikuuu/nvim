vim.pack.add({
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/benomahony/oil-git.nvim"
})

require "oil".setup()
vim.keymap.set("n", "<leader>n", ":Oil<CR>")

require "oil-git".setup()
