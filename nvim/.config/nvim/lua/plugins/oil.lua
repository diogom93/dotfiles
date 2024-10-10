return {
	{ -- File explorer
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				view_options = {
					show_hidden = true,
				},
			})

			vim.keymap.set("n", "<leader>ef", "<cmd>Oil<CR>", { desc = "[E]xplorer [F]ull-screen" })
			vim.keymap.set("n", "<leader>ew", "<cmd>Oil --float<CR>", { desc = "[E]xplorer [W]indow" })
		end,
	},
}
