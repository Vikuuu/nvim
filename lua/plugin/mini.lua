vim.pack.add({
    "https://github.com/echasnovski/mini.pick",
})
require "mini.pick".setup()
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
