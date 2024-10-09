return {
	{
		"ggandor/leap.nvim",
		config = function()
			vim.keymap.set({ "n", "x", "o" }, "<leader>lf", "<Plug>(leap-forward)", { desc = "[L]eap [F]orward" })
			vim.keymap.set({ "n", "x", "o" }, "<leader>lb", "<Plug>(leap-backward)", { desc = "[L]eap [B]ackward" })
			vim.keymap.set(
				{ "n", "x", "o" },
				"<leader>lw",
				"<Plug>(leap-from-window)",
				{ desc = "[L]eap from [W]indow" }
			)
		end,
	},
}
