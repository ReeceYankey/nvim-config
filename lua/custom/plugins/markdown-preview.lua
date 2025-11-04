-- you can alternatively install with npm/yarn (https://github.com/iamcco/markdown-preview.nvim)
-- I had to run `:call mkdp#util#install()` to install this non npm/yarn version
return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
}
