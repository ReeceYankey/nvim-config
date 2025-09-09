local map = vim.keymap.set

return {
  'scalameta/nvim-metals',
  dependencies = { 'j-hui/fidget.nvim' },
  ft = { 'scala', 'sbt', 'java' },
  opts = function()
    local metals_config = require('metals').bare_config()
    metals_config.init_options.statusBarProvider = 'off'
    metals_config.on_attach = function(client, bufnr)
      -- your on_attach function
      -- LSP mappings
      map('n', 'grd', vim.lsp.buf.definition)
      map('n', 'K', vim.lsp.buf.hover)
      map('n', 'gri', vim.lsp.buf.implementation)
      map('n', 'grr', vim.lsp.buf.references)
      map('n', 'gO', vim.lsp.buf.document_symbol)
      map('n', 'gW', vim.lsp.buf.workspace_symbol)
      -- map('n', '<leader>cl', vim.lsp.codelens.run)
      -- map('n', '<leader>sh', vim.lsp.buf.signature_help)
      map('n', 'grn', vim.lsp.buf.rename)
      -- map('n', '<leader>f', vim.lsp.buf.format)
      map('n', 'gra', vim.lsp.buf.code_action)
      --
      -- map('n', 'grm', function()
      --   require('telescope').extensions.metals.commands()
      -- end, { noremap = true, desc = 'open metals menu' })
    end

    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = self.ft,
      callback = function()
        require('metals').initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
}
