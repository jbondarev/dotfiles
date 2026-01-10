return {
	{
		'nvim-telescope/telescope.nvim', tag = 'v0.2.1',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- optional but recommended
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		keys = {
			{ "<leader>sf", function() require("telescope.builtin").find_files() end, desc = "Telescope find files" },
			{ "<leader>sg", function() require("telescope.builtin").live_grep() end, desc = "Telescope live grep" },
			{ "<leader>sb", function() require("telescope.builtin").buffers() end, desc = "Telescope buffers" },
			{ "<leader>sh", function() require("telescope.builtin").help_tags() end, desc = "Telescope help tags" },
		},
		config = function()
			require("telescope").setup{}
		end,
	}
}
