return {
	{
		'nvim-telescope/telescope.nvim', 
		tag = 'v0.2.1',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-file-browser.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function(_, opts)
			local telescope = require("telescope")

			opts.defaults = {
				wrap_results = true,
				layout_config = { prompt_position = "top" }
			}

			opts.extensions = {
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
					respect_gitignore = false,
					hidden = true,
					grouped = true, 
					previewer = false,
					layout_config = { height = 40 }
				} 
			}
			telescope.setup(opts)

			telescope.load_extension("file_browser")
			telescope.load_extension("fzf")
		end,
		keys = {
			{
				"<leader>;f",
				function()
					local builtin = require("telescope.builtin")
					builtin.find_files({
						no_ignore=false,
						hidden=true,

					})
				end
			},
			{
				"<leader>;g",
				function()
					local builtin = require("telescope.builtin")
					builtin.live_grep()
				end
			},
			{
				"<leader>sf",
				function() 
					local telescope = require("telescope")
					local function telescope_buffer_dir()
						return vim.fn.expand("%:p:h")
					end
					telescope.extensions.file_browser.file_browser({
						path = "%:p:h",
						cwd = telescope_buffer_dir(),
						respect_gitignore = false,
						hidden = true,
						grouped = true, 
						previewer = false,
						layout_config = { height = 40 }
					})
				end
			}
		},
	},
}
