return {
  "BenHeil26/smartmarks.nvim",
  config = function()
    require('smartmarks').setup({
      show_virtual = true,
      float_options = {
        relative = 'cursor',
        row = 1,
        col = 1,
        anchor = "NW",
        style = "minimal",
        title = "smart_marks",
        title_pos = "center",
        border = "double",
      }
    })
  end
}
