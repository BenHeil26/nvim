return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    opts = {
      window = {
        layout = 'float',       -- 'vertical', 'horizontal', 'float', 'replace', or a function that returns the layout
        width = 0.5,            -- fractional width of parent, or absolute width in columns when > 1
        height = 1,             -- fractional height of parent, or absolute height in rows when > 1
        -- Options below only apply to floating windows
        relative = 'win',       -- 'editor', 'win', 'cursor', 'mouse'
        border = 'double',      -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
        row = nil,              -- row position of the window, default is centered
        col = 80,               -- column position of the window, default is centered
        title = 'Copilot Chat', -- title of chat window
        footer = nil,           -- footer of chat window
        zindex = 1,             -- determines if window is on top or below other floating windows
        blend = 0,              -- window blend (transparency), 0-100, 0 is opaque, 100 is fully transparent
      }
    },
    init = function()
      vim.keymap.set("n", "<leader>C", function()
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if not git_root or git_root == "" then
          vim.notify("Not inside a git repository", vim.log.levels.ERROR)
          return
        end
        local file_path = vim.fn.expand("%:p")
        local rel_path = file_path:sub(#git_root + 2) -- +2 to skip '/' after git_root
        local file_prompt = "#file:./" .. rel_path .. " "
        local user_prompt = vim.fn.input("prompt > ")
        vim.cmd("CopilotChat " .. file_prompt .. user_prompt)
      end, { noremap = true, silent = true, desc = "CopilotChat with relative file path in prompt" })
      vim.keymap.set('v', '<leader>cf', ":<C-u>CopilotChatFix<CR>",
        { noremap = true, silent = true, desc = "CopilotChat Fix selection" })
      vim.keymap.set('v', '<leader>ce', ":<C-u>CopilotChatExplain<CR>",
        { noremap = true, silent = true, desc = "CopilotChat Explain selection" })
      vim.keymap.set('v', '<leader>ct', ":<C-u>CopilotChatTests<CR>",
        { noremap = true, silent = true, desc = "CopilotChat Generate tests for selection" })
      vim.keymap.set('v', '<leader>cr', ":<C-u>CopilotChatReview<CR>",
        { noremap = true, silent = true, desc = "CopilotChat Review selection" })
      vim.keymap.set('v', '<leader>co', ":<C-u>CopilotChatOptimize<CR>",
        { noremap = true, silent = true, desc = "CopilotChat Optimize selection" })
      vim.keymap.set('v', '<leader>cd', ":<C-u>CopilotChatDocs<CR>",
        { noremap = true, silent = true, desc = "CopilotChat Docs for selection" })
    end,
  },
}
