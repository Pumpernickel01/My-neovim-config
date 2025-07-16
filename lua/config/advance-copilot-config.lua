return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("CopilotChat").setup {
        debug = true,
        model = 'claude-sonnet-4', -- Use Claude Sonnet 4 by default
        
        -- Enhanced agent-like prompts
        prompts = {
          GenerateCode = {
            prompt = "Generate complete, production-ready code for the following requirement. Include error handling, documentation, and tests where appropriate:",
            mapping = "<leader>cg",
          },
          RefactorCode = {
            prompt = "Refactor the selected code to improve readability, performance, and maintainability. Explain the changes:",
            mapping = "<leader>cr",
          },
          CreateTests = {
            prompt = "Generate comprehensive unit tests for the selected code. Use the appropriate testing framework:",
            mapping = "<leader>ct",
          },
          ArchitectSolution = {
            prompt = "Design and implement a complete solution for this problem. Include architecture decisions, code structure, and implementation:",
            mapping = "<leader>ca",
          },
        },
        
        -- Window configuration for better agent interaction
        window = {
          layout = 'vertical',
          width = 0.4,
          height = 0.8,
        },
      }
    end,
  },
}
