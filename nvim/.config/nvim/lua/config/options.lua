-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- NOTE: Prioritise the .git directory for root detection over the LSP server's suggestion.
--       This ensures that global tools like Telescope always operate from the monorepo root.
vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }
