vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.nvim" },
})

require("mini.icons").setup()
require("mini.ai").setup()
require("mini.surround").setup()
require("mini.splitjoin").setup()
require("mini.move").setup()
require("mini.pairs").setup()
require("mini.statusline").setup()

MiniIcons.mock_nvim_web_devicons()
