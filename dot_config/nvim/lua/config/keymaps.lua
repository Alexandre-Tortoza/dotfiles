-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover({ border = "rounded" })
end, { desc = "Show Documentation" })

vim.keymap.set({ "n", "i" }, "<C-k>", function()
  vim.lsp.buf.signature_help({ border = "rounded" })
end, { desc = "Signature Help" })

vim.keymap.set("n", "<leader>cd", function()
  vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Line Diagnostics" })
