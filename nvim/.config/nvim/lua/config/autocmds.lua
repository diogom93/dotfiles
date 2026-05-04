vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Unfold all folds when entering a buffer",
	group = vim.api.nvim_create_augroup("unfold-on-enter", { clear = true }),
	callback = function()
		vim.cmd("normal! zR")
	end,
})
