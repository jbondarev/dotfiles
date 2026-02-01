vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local opts = { buffer = bufnr, silent = true }

		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition,
			vim.tbl_extend("force", opts, { desc = "Go to definition." }))
		vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration,
			vim.tbl_extend("force", opts, { desc = "Go to declaration." }))
		vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation,
			vim.tbl_extend("force", opts, { desc = "Go to implementation." }))
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references,
			vim.tbl_extend("force", opts, { desc = "Go to references." }))
		vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
		vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end,
			vim.tbl_extend("force", opts, { desc = "Format." }))
	end,
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
