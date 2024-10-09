return {
	{ -- Zen mode
		"folke/zen-mode.nvim",
		config = function()
			vim.keymap.set("n", "<leader>z", function()
				require("zen-mode").setup({
					window = {
						width = 160,
						backdrop = 1,
					},
				})

				require("zen-mode").toggle()
			end, { desc = "Toggle [Z]en mode" })
		end,
	},
}
