local key = vim.keymap

key.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

key.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous [D]iagnostic message" })
key.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next [D]iagnostic message" })
key.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
key.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

key.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

key.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
key.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
key.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
key.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
