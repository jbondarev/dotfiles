return {
	{
		'nvim-mini/mini.pairs',
		version = '*',
		opts = {}
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { show_start = true, show_end = false }
		},
	},
}
