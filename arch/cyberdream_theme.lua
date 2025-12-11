require("cyberdream").setup({
  transparent = true,
  saturation = .6,
  italic_comments = true,
  hide_fillchars = true,
  borderless_pickers = true,
  highlights = {
    -- Highlight groups to override, adding new groups is also possible
    -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values
    Visual = { fg = "NONE", bg = "#8FD8DC", italic = false },
    MatchParen = { fg = "#D16DFF", bg = "NONE", bold = true }
  },

})

vim.cmd("colorscheme cyberdream")
