vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
})

local oil = require("oil")
oil.setup()

vim.keymap.set("n", "<leader>e", oil.toggle_float, { desc = "File [E]xplorer" })
