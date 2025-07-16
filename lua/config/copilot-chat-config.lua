require("CopilotChat").setup {
  debug = true,
  model = 'claude-sonnet-4', -- Default model preference
  -- You can also configure this per session
  prompts = {
    Explain = {
      model = 'claude-sonnet-4',
    },
    Review = {
      model = 'claude-opus-4', -- Use Opus for complex reviews
    },
  },
}
