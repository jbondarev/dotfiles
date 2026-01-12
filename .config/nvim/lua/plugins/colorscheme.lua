return { 
	{ 
		"ellisonleao/gruvbox.nvim", 
		priority = 1000 , 
		init = function()
			vim.o.background = "dark"
			vim.cmd.colorscheme("gruvbox")
		end, 
		opts = {
			terminal_colors = true,
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
			transparent_mode = false
		} 
	}
}
