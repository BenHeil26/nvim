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

-- gitsigns {{{
require('gitsigns').setup {
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)

    map('v', '<leader>hs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('v', '<leader>hr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hi', gitsigns.preview_hunk_inline)

    map('n', '<leader>hb', function()
      gitsigns.blame_line({ full = true })
    end)

    map('n', '<leader>hd', gitsigns.diffthis)

    map('n', '<leader>hD', function()
      gitsigns.diffthis('~')
    end)

    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
    map('n', '<leader>hq', gitsigns.setqflist)

    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>tw', gitsigns.toggle_word_diff)

    -- Text object
    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
  end
}
-- }}}
