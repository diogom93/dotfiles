-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	require("plugins.autocomplete"),
	require("plugins.autoformat"),
	require("plugins.autopairs"),
	require("plugins.autotags"),
	require("plugins.blame"),
	require("plugins.comments"),
	require("plugins.copilot"),
	require("plugins.dashboard"),
	require("plugins.gitsigns"),
	require("plugins.harpoon"),
	require("plugins.indentguide"),
	require("plugins.keybindings"),
	require("plugins.leap"),
	require("plugins.lsp"),
	require("plugins.mini"),
	require("plugins.oil"),
	require("plugins.repeat"),
	require("plugins.statusline"),
	require("plugins.tabs"),
	require("plugins.telescope"),
	require("plugins.theme"),
	require("plugins.todos"),
	require("plugins.treesitter"),
	require("plugins.trouble"),
	require("plugins.undotree"),
	require("plugins.vimbegood"),
	require("plugins.zen"),
}, {
	ui = {
		-- If you have a Nerd Font, set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
