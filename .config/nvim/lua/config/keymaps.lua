-- Use tab for indenting in visual/select mode
vim.api.nvim_set_keymap("x", "<Tab>", ">gv|", { desc = "Indent Left" })
vim.api.nvim_set_keymap("x", "<S-Tab>", "<gv", { desc = "Indent Right" })

-- Restore normal VIM Y behavior (yank full line)
vim.keymap.del("n", "Y")

-- Ctrl+B for building
vim.api.nvim_set_keymap("n", "<leader>cB", "<cmd>CMakeBuild<CR>", { desc = "Run CMake build" })

-- Override ft keymap for floating terminal
vim.api.nvim_set_keymap(
  "n",
  "<C-\\>",
  '<cmd>lua Snacks.terminal(nil, { win = {position = "float"}})<CR>',
  { desc = "Open floating terminal" }
)

-- Send LSP items to quickfix list
vim.api.nvim_set_keymap(
  "n",
  "<leader>cq",
  "<cmd>lua vim.diagnostic.setqflist()<CR>",
  { desc = "Send LSP items to quickfix" }
)

-- Replace without yanking
vim.api.nvim_set_keymap("x", "<leader>P", '"_dP', { desc = "Replace without yanking" })
