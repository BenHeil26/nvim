return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {},
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }
    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#b36a6c" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#b6a96a" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#6a8cae" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#b48a65" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#7a9c7a" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#9a7cae" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#6aa0a6" })
    end)

    require("ibl").setup { indent = { highlight = highlight } }
  end
}
