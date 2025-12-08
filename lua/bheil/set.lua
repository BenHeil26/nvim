vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.o.scrolloff = 8
vim.opt.wrap = false

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local group = vim.api.nvim_create_augroup("LspFormat_" .. args.buf, { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = group,
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format { async = false, id = args.data.client_id }
      end,
    })
  end
})

vim.lsp.handlers["textDocument/semanticTokens/full"] = function() end

vim.opt.guicursor = {
  "n-v-c:block",
  "i-ci-ve:block-blinkwait700-blinkoff400-blinkon250",
  "r-cr:hor20",
  "o:hor50",
  "a:"
}

vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>")

vim.keymap.set("n", "<leader>nls", "<cmd>ZkNotes<cr>")
vim.keymap.set("v", "<leader>nm", "<cmd>'<,'>ZkMatch<cr>")
