return {
	{
		"nvimdev/dashboard-nvim",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
		event = "VimEnter",
		config = function()
			local dashboard = require("dashboard")

			dashboard.setup({
				theme = "hyper",
				config = {
					week_header = {
						enable = true,
					},
					shortcut = {
						{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
						{
							icon = " ",
							icon_hl = "@variable",
							desc = "Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						{
							desc = " dotfiles",
							group = "Number",
							action = "Telescope find_files cwd=~/.config/",
							key = "d",
						},
					},
				},
			})

			-- vim.api.nvim_create_autocmd("BufDelete", {
			-- 	group = vim.api.nvim_create_augroup("last_buf", { clear = true }),
			-- 	callback = function()
			-- 		local buf_len = 0
			-- 		---@diagnostic disable-next-line: param-type-mismatch
			-- 		for i = 1, vim.fn.bufnr("$") do
			-- 			if vim.api.nvim_buf_is_loaded(i) then
			-- 				buf_len = buf_len + 1
			-- 				break
			-- 			end
			-- 		end
			--
			-- 		if buf_len == 1 then
			-- 			vim.cmd("Dashboard")
			-- 		end
			-- 	end,
			-- })
		end,
	},
}
