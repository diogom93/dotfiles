return {
	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			local wk = require("which-key")

			wk.add({

				{ "<leader>c", group = "[C]ode" },
				{ "<leader>c_", hidden = true },
				{ "<leader>d", group = "[D]ocument" },
				{ "<leader>d_", hidden = true },
				{ "<leader>e", group = "[E]xplorer" },
				{ "<leader>e_", hidden = true },
				{ "<leader>h", group = "[H]arpoon" },
				{ "<leader>h_", hidden = true },
				{ "<leader>l", group = "[L]eap" },
				{ "<leader>l_", hidden = true },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>r_", hidden = true },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>s_", hidden = true },
				{ "<leader>t", group = "[T]rouble" },
				{ "<leader>t_", hidden = true },
				{ "<leader>w", group = "[W]orkspace" },
				{ "<leader>w_", hidden = true },
			})
			-- Document existing key chains
			-- require("which-key").register({
			-- 	["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
			-- 	["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
			-- 	["<leader>e"] = { name = "[E]xplorer", _ = "which_key_ignore" },
			-- 	["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
			-- 	["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
			-- 	["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
			-- 	["<leader>l"] = { name = "[L]eap", _ = "which_key_ignore" },
			-- 	["<leader>t"] = { name = "[T]rouble", _ = "which_key_ignore" },
			-- 	["<leader>h"] = { name = "[H]arpoon", _ = "which_key_ignore" },
			-- })
		end,
	},
}
