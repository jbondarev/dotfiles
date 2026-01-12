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
			scope = {}
		},
	}
}
