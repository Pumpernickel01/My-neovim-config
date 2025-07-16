return {
  "github/copilot.vim",
  event = "VeryLazy",
  config = function()
    -- Optional: Configure Copilot settings
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_tab_fallback = ""
    
    -- Key mappings
    local keymap = vim.keymap.set
    keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    keymap("i", "<C-K>", 'copilot#Previous()', { silent = true, expr = true })
    keymap("i", "<C-L>", 'copilot#Next()', { silent = true, expr = true })
    keymap("i", "<C-H>", 'copilot#Dismiss()', { silent = true, expr = true })
  end,
}
