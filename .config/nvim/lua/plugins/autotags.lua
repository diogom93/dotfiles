return {
	{ -- Auto close and rename tags
		"windwp/nvim-ts-autotag",
		depends = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}
