return {
  -- Modern Copilot implementation
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom",
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node',
        server_opts_overrides = {},
      })
    end,
  },

  -- Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("CopilotChat").setup({
        debug = true,
        model = 'claude-sonnet-4', -- Use Claude Sonnet 4 as default model

        -- Custom prompts for better productivity
        prompts = {
          Explain = {
            prompt = "/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.",
          },
          Review = {
            prompt = "/COPILOT_REVIEW Review the selected code.",
          },
          Fix = {
            prompt = "/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.",
          },
          Optimize = {
            prompt = "/COPILOT_GENERATE Optimize the selected code to improve performance and readability.",
          },
          Docs = {
            prompt = "/COPILOT_GENERATE Please add documentation comment for the selection.",
          },
          Tests = {
            prompt = "/COPILOT_GENERATE Please generate tests for my code.",
          },
        },

        -- Window configuration
        window = {
          layout = 'vertical',
          width = 0.4,
          height = 0.6,
          -- Options below only apply to floating windows
          relative = 'editor',
          border = 'single',
          row = nil,
          col = nil,
          title = 'Copilot Chat',
          footer = nil,
          zindex = 1,
        },
      })

      -- Key mappings for Copilot Chat
      vim.keymap.set("n", "<leader>cc", ":CopilotChat<CR>", { desc = "Open Copilot Chat" })
      vim.keymap.set("v", "<leader>cc", ":CopilotChat<CR>", { desc = "Open Copilot Chat with selection" })
      vim.keymap.set("n", "<leader>ce", ":CopilotChatExplain<CR>", { desc = "Explain code" })
      vim.keymap.set("n", "<leader>cr", ":CopilotChatReview<CR>", { desc = "Review code" })
      vim.keymap.set("n", "<leader>cf", ":CopilotChatFix<CR>", { desc = "Fix code" })
      vim.keymap.set("n", "<leader>co", ":CopilotChatOptimize<CR>", { desc = "Optimize code" })
      vim.keymap.set("n", "<leader>cd", ":CopilotChatDocs<CR>", { desc = "Generate docs" })
      vim.keymap.set("n", "<leader>ct", ":CopilotChatTests<CR>", { desc = "Generate tests" })
    end,
  },
}
