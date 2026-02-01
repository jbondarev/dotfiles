return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{ "<leader>g", group = "Go to.", },
			{ "<leader>x", group = "Code analytics.", },
			{ "<leader>;", group = "Code search.", },
			{ "<leader>s", group = "File search.", },
		}
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
