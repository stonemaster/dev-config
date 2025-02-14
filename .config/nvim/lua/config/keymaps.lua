-- Use tab for indenting in visual/select mode
vim.api.nvim_set_keymap("x", "<Tab>", ">gv|", { desc = "Indent Left" })
vim.api.nvim_set_keymap("x", "<S-Tab>", "<gv", { desc = "Indent Right" })

-- Restore normal VIM Y behavior (yank full line)
vim.keymap.del("n", "Y")

-- Ctrl+B for building
vim.api.nvim_set_keymap("n", "<leader>cB", "<cmd>CMakeBuild<CR>", { desc = "Run CMake build" })
