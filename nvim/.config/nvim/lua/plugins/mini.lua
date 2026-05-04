vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.nvim" },
})

require("mini.icons").setup()

require("mini.files").setup()
require("mini.ai").setup()
require("mini.surround").setup()
require("mini.splitjoin").setup()
require("mini.move").setup()
require("mini.pairs").setup()
require("mini.tabline").setup()
require("mini.statusline").setup()

MiniIcons.mock_nvim_web_devicons()
vim.keymap.set("n", "<leader>ew", MiniFiles.open, { desc = "[E]xplorer [W]indow" })
