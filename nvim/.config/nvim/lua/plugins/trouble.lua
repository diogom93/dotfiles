return {
	{ -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		config = function()
			require("trouble").setup()

			vim.keymap.set(
				"n",
				"<leader>ts",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				{ desc = "[T]rouble: [S]ymbols list" }
			)
			vim.keymap.set(
				"n",
				"<leader>td",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				{ desc = "[T]rouble: [D]ocument diagnostics" }
			)
			vim.keymap.set("n", "<leader>tq", "<cmd>Trouble qflist toggle<cr>", { desc = "[T]rouble: [Q]uickfix list" })
			vim.keymap.set(
				"n",
				"<leader>tl",
				"<cmd>Trouble loclist toggle<cr>",
				{ desc = "[T]rouble: [L]ocation list" }
			)
			vim.keymap.set(
				"n",
				"gR",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				{ desc = "[T]rouble: LSP [R]references" }
			)
			vim.keymap.set("n", "<leader>tt", "<cmd>Trouble todo toggle<cr>", { desc = "[T]rouble: [T]odo" })
		end,
	},
}
