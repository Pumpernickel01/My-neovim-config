return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			-- Terminal configuration
			size = 20,
			open_mapping = [[<c-b>]], -- This sets Ctrl-b as the toggle key
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
			persist_size = true,
			direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- Toggle terminal in normal mode (this is redundant with open_mapping but shows explicit setup)
		map("n", "<C-b>", "<cmd>ToggleTerm<cr>", opts)
	end,
}
