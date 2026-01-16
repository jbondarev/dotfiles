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
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			{
				options = {
					icons_enabled = true,
					theme = 'gruvbox_dark',
					component_separators = { left = '', right = ''},
					section_separators = { left = '', right = ''},
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					always_show_tabline = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
						refresh_time = 16, -- ~60fps
						events = {
							'WinEnter',
							'BufEnter',
							'BufWritePost',
							'SessionLoadPost',
							'FileChangedShellPost',
							'VimResized',
							'Filetype',
							'CursorMoved',
							'CursorMovedI',
							'ModeChanged',
						},
					}
				},
				sections = {
					lualine_a = {'mode'},
					lualine_b = {'branch', 'diff', 'diagnostics'},
					lualine_c = {'filename'},
					lualine_x = {'encoding', 'fileformat', 'filetype'},
					lualine_y = {'progress'},
					lualine_z = {'location'}
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {'filename'},
					lualine_x = {'location'},
					lualine_y = {},
					lualine_z = {}
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {}
			}
		}
	}
}
