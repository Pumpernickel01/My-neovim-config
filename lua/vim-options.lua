vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.o.splitright = true
vim.opt.scrolloff = 10

-- Window navigation
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Go to the down window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Go to the up window" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Go to the left window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Go to the right window" })

-- Window splitting
vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })

-- Window closing
vim.keymap.set("n", "<leader>wc", "<C-w>c", { desc = "Close current window" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { desc = "Close all other windows" })

-- Window resizing
vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Make all windows equal size" })
vim.keymap.set("n", "<leader>w-", "5<C-w>-", { desc = "5 Decrease window height" })
vim.keymap.set("n", "<leader>w+", "5<C-w>+", { desc = "5 Increase window height" })
vim.keymap.set("n", "<leader>w<", "5<C-w><", { desc = "5 Decrease window width" })
vim.keymap.set("n", "<leader>w>", "5<C-w>>", { desc = "5 Increase window width" })

-- Terminal commands
vim.keymap.set("n", "<leader>tt", ":terminal<CR>", { desc = "Open terminal in current window" })
vim.keymap.set("n", "<leader>ts", ":split | terminal<CR>", { desc = "Open terminal in horizontal split" })
vim.keymap.set("n", "<leader>tv", ":vsplit | terminal<CR>", { desc = "Open terminal in vertical split" })

-- Toggle terminal function (more advanced)
local terminal_buf = nil
local terminal_win = nil

local function toggle_terminal()
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_close(terminal_win, false)
    terminal_win = nil
  else
    vim.cmd("botright 15split")
    if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
      vim.api.nvim_win_set_buf(0, terminal_buf)
    else
      vim.cmd("terminal")
      terminal_buf = vim.api.nvim_get_current_buf()
    end
    terminal_win = vim.api.nvim_get_current_win()
  end
end

vim.keymap.set("n", "<leader>tg", toggle_terminal, { desc = "Toggle terminal" })
