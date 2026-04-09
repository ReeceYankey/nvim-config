local is_nix = require('utils').is_nix
local nix_ts_path = os.getenv 'NIX_NVIM_TREESITTER'

return {
  'nvim-treesitter/nvim-treesitter',
  build = is_nix and false or ':TSUpdate',
  main = 'nvim-treesitter.configs',
  dir = (is_nix and nix_ts_path) and nix_ts_path or nil,
  opts = {
    ensure_installed = is_nix and {} or {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
    },
    auto_install = not is_nix,
    -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
    --  If you are experiencing weird indenting issues, add the language to
    --  the list of additional_vim_regex_highlighting and disabled languages for indent.
    highlight = { enable = true, additional_vim_regex_highlighting = { 'ruby' } },
    indent = { enable = true, disable = { 'ruby' } },
  },
}
-- There are additional nvim-treesitter modules that you can use to interact
-- with nvim-treesitter. You should go explore a few and see what interests you:
--
--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
