return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  branch = "main",
  config = function()
    local treesitter = require("nvim-treesitter")
    treesitter.setup()
    treesitter.install {
      'c',
      'cpp',
      'go',
      'html',
      'java',
      'javascript',
      'lua',
      'query',
      'rust',
      'typescript',
      'vim',
      'vimdoc',
      'yaml',
      'zig',
    }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'java', 'c', 'lua', 'vim', 'vimdoc', 'query', 'elixir', 'heex', 'javascript', 'typescript', 'html', 'yaml' },
      callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- folds, provided by Neovim (only want manual folds)
        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo.foldmethod = 'expr'
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end
}
