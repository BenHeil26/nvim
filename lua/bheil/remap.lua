vim.g.mapleader = " "

-- netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- zenmode
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>")

-- zk commands {{{
vim.keymap.set("n", "<leader>nls", "<cmd>ZkNotes<cr>")
vim.keymap.set("v", "<leader>nm", "<cmd>'<,'>ZkMatch<cr>")
vim.api.nvim_create_user_command(
  "ZkDaily",
  function()
    local file_path = vim.fn.system("zk get-daily")
    vim.fn.system("zk daily")
    vim.cmd("edit " .. file_path)
  end,
  {}
)
vim.keymap.set("n", "<leader>nd", "<cmd>ZkDaily<cr>")
vim.keymap.set("n", "<leader>nt", "<cmd>ZkTags<cr>")
vim.api.nvim_create_user_command(
  "ZkFleeting",
  function()
    local note = vim.fn.input('Note > ')
    vim.fn.system("echo " .. note .. " | zk fl")
    print("\r\nFleeting note created!")
  end,
  {}
)
vim.keymap.set("n", "<leader>nf", "<cmd>ZkFleeting<cr>")
-- }}}

-- terminal {{{
vim.api.nvim_create_user_command("SplitTerminal",
  function()
    local function get_open_terminal()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
          return win
        end
      end
      return false
    end
    local window = get_open_terminal()
    if not window then
      vim.cmd("belowright split")
      vim.cmd("terminal")
      vim.cmd("resize -10")
    else
      vim.api.nvim_set_current_win(window)
    end
  end,
  {}
)
vim.keymap.set("n", "<leader>ts", "<cmd>SplitTerminal<cr>")
-- }}}
