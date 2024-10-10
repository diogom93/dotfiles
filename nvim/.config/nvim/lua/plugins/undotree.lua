return {
	{ -- Browse and switch between different undo branches
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle [U]ndo tree" })
		end,
	},
}
