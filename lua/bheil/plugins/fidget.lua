return {
  "j-hui/fidget.nvim",
  opts = {
   -- Options related to integrating with other plugins
    integration = {
      ["nvim-tree"] = {
        enable = true,              -- Integrate with nvim-tree/nvim-tree.lua (if installed)
        -- DEPRECATED; use notification.window.avoid = { "NvimTree" }
      },
      ["xcodebuild-nvim"] = {
        enable = true,              -- Integrate with wojciech-kulik/xcodebuild.nvim (if installed)
        -- DEPRECATED; use notification.window.avoid = { "TestExplorer" }
      },
    },   -- options
  },
}
