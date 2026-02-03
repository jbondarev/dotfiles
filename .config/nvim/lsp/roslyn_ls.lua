vim.lsp.config['roslyn_ls'] = {
   cmd = {
    'dotnet',
    vim.fs.joinpath(vim.fn.stdpath('data'), 'mason', 'packages', 'roslyn', 'libexec', 'Microsoft.CodeAnalysis.LanguageServer.dll'),
    '--logLevel',
    'Information',
    '--extensionLogDirectory',
    vim.fs.joinpath(vim.uv.os_tmpdir(), 'roslyn_ls/logs'),
    '--stdio',
  },
}
