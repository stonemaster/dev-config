-- Use tab for indenting in visual/select mode
vim.api.nvim_set_keymap("x", "<Tab>", ">gv|", { desc = "Indent Left" })
vim.api.nvim_set_keymap("x", "<S-Tab>", "<gv", { desc = "Indent Right" })
vim.api.nvim_set_keymap("n", "sb", "<cmd>buffer#<CR>", { desc = "Alternate buffer" })
