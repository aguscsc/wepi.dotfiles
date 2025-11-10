-- This line is fine
require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "rust_analyzer", "clangd" }
vim.lsp.enable(servers)

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      -- 🔽 THIS IS THE CORRECTED SECTION 🔽
      check = {
        command = "clippy", -- Use clippy for checks
        onSave = true,      -- Enable check on save
      },
      -- 🔼 END OF CORRECTION 🔼
      diagnostics = {
        enable = true,
        experimental = { enable = true },
      },
    },
  },
})
