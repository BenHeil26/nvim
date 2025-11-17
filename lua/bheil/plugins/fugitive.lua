return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    vim.keymap.set("n", "<leader>ga", "<cmd>:Git add .<CR>")
    vim.keymap.set("n", "<leader>gc", function()
      local msg = vim.fn.input("msg > ")
      vim.cmd(":Git commit -m '" .. msg .. "'")
    end)
    vim.keymap.set("n", "<leader>gC", function()
      local branch = vim.fn.input("name > ")
      vim.cmd(":Git checkout -B '" .. branch .. "'")
    end)
    vim.keymap.set("n", "<leader>gp", "<cmd>:Git pull<cr>")
    vim.keymap.set("n", "<leader>gP", "<cmd>:Git push<cr>")
    vim.keymap.set("n", "<leader>gh", "<cmd>:Gdiffsplit<CR>")
  end
}
