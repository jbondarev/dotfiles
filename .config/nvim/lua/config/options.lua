-- wrapping and tabs
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.wrap = false

-- numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 8
vim.opt.cmdheight = 0
vim.opt.termguicolors = true

vim.opt.updatetime = 250

-- Format C# files with LSP before save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.cs",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})
