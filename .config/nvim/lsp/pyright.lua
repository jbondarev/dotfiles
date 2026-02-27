vim.lsp.config('pyright', {
  before_init = function(_, config)
    local root = vim.fs.root(0, { ".venv" })
    if root then
      local venv = root .. "/.venv/bin/python"
      if vim.fn.filereadable(venv) == 1 then
        config.settings.python.pythonPath = venv
      end
    end
  end,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})
