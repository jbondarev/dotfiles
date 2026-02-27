vim.lsp.config('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        pyflakes = { enabled = true },
        pylint = { enabled = true },
      }
    }
  }
})
