return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",             -- JavaScript/TypeScript
          "html",              -- HTML
          "cssls",             -- CSS
          "pyright",           -- Python
          "rust_analyzer",     -- Rust
          "gopls",             -- Go
          "clangd",            -- C/C++
          "omnisharp",         -- C#
          "jdtls",             -- Java
          "lua_ls",            -- Lua
          "phpactor",          -- PHP
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      -- Configure diagnostics display
      vim.diagnostic.config({
        virtual_text = true,  -- Show diagnostics as virtual text
        signs = true,         -- Show diagnostic signs in the sign column
        update_in_insert = false,  -- Don't update diagnostics while typing
        underline = true,     -- Underline diagnostic text
        severity_sort = true, -- Sort by severity
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
      
      -- Setup all installed servers with capabilities
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.cssls.setup({
        capabilities = capabilities
      })
      lspconfig.pyright.setup({
        capabilities = capabilities
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities
      })
      lspconfig.gopls.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      lspconfig.omnisharp.setup({
        capabilities = capabilities
      })
      lspconfig.jdtls.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.phpactor.setup({
        capabilities = capabilities
      })
      
      -- Basic keymaps
      vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>r', vim.lsp.buf.references, {})
      vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action, {})
    end
  }
}
