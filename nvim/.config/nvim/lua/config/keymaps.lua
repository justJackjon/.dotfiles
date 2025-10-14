-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remap Join Line (Due to Better HJKL)
vim.keymap.set("n", "<Leader>cj", "J", { noremap = true })

-- Remap LSP Hover (Due to Better HJKL)
vim.keymap.set("n", "gK", vim.lsp.buf.hover, { noremap = true })

-- Better HJKL
vim.keymap.set("n", "<S-h>", "^", { noremap = true })
vim.keymap.set("n", "<S-l>", "$", { noremap = true })
vim.keymap.set("n", "<S-j>", "<C-d>", { noremap = true })
vim.keymap.set("n", "<S-u>", "<C-u>", { noremap = true })
vim.keymap.set("i", "jk", "<ESC>", { noremap = true })
