-- return {}

-- CATPPUCCIN THEME
return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	-- priority = 500,
	config = function()
		vim.cmd.colorscheme("catppuccin-mocha")
		-- this command to make the background transparent
		-- vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}

-- OXOCARBON THEME
-- return {
--	"nyoom-engineering/oxocarbon.nvim",
-- Add in any other configuration;
--   event = foo,
--   config = bar
--   end,
-- config = function()
--	vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
-- end,
-- }
