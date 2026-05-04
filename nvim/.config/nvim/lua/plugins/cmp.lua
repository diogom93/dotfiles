vim.pack.add({
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/saghen/blink.cmp", version = "v1" },
})

vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true }),
	once = true,
	callback = function()
		require("blink.cmp").setup()
	end,
})

