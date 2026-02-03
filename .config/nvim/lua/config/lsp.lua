vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local opts = { buffer = bufnr, silent = true }

		-- Enable inlay hints
		if client and client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end

		if client and client.server_capabilities.codeLensProvider then
      vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
        buffer = bufnr,
        callback = function()
          vim.lsp.codelens.refresh({ bufnr = bufnr })
        end,
      })
    end
		
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

		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
			vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
			vim.tbl_extend("force", opts, { desc = "Code action" }))
		vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition,
			vim.tbl_extend("force", opts, { desc = "Go to type definition" }))
		vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol,
			vim.tbl_extend("force", opts, { desc = "Document symbols" }))
		vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol,
			vim.tbl_extend("force", opts, { desc = "Workspace symbols" }))
		vim.keymap.set("n", "<leader>ih", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
		end, vim.tbl_extend("force", opts, { desc = "Toggle inlay hints" }))

		vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help,
			vim.tbl_extend("force", opts, { desc = "Signature help" }))

		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,
			vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next,
			vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float,
			vim.tbl_extend("force", opts, { desc = "Show diagnostic" }))
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist,
			vim.tbl_extend("force", opts, { desc = "Diagnostics to loclist" }))

		vim.keymap.set('n', '<leader>cl', vim.lsp.codelens.run, { buffer = bufnr, desc = 'Run code lens' })
	end,
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("svelte_ls")
vim.lsp.enable("roslyn_ls")
