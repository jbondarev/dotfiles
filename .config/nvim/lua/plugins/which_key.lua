return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{ "<leader>g", group = "Go to.", },
			{ "x", group = "Code analytics.", },
			{ ";", group = "Code search.", },
			{ "s", group = "File search.", },
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
