-- Use tab for indenting in visual/select mode
vim.api.nvim_set_keymap("x", "<Tab>", ">gv|", { desc = "Indent Left" })
vim.api.nvim_set_keymap("x", "<S-Tab>", "<gv", { desc = "Indent Right" })

-- Alternate buffer with `sb`
vim.api.nvim_set_keymap("n", "sb", "<cmd>buffer#<CR>", { desc = "Alternate buffer" })
-- vim.api.nvim_set_keymap("n", "<C-/>", "<cmd>ToggleTerm<CR>", { desc = "Open `:ToggleTerm` floating terminal" })

-- Restore normal VIM Y behavior (yank full line)
vim.keymap.del("n", "Y")
