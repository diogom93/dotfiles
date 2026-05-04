vim.pack.add({
	{ src = "https://github.com/folke/trouble.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/folke/flash.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
})

require("trouble").setup()
require("todo-comments").setup()

require("flash").setup({
	modes = {
		-- Enhanced f, t, F, T motions
		char = {
			enabled = true,
			jump_labels = true,
		},
	},
})

local flash = require("flash")
vim.keymap.set({ "n", "x", "o" }, "s", function()
	flash.jump()
end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function()
	flash.treesitter()
end, { desc = "Flash Treesitter" })
vim.keymap.set("o", "r", function()
	flash.remote()
end, { desc = "Remote Flash" })
vim.keymap.set({ "x", "o" }, "R", function()
	flash.treesitter_search()
end, { desc = "Treesitter Search" })
vim.keymap.set("c", "<c-s>", function()
	flash.toggle()
end, { desc = "Toggle Flash Search" })
