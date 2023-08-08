-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})
vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  command = "echohl WarningMsg | echo \"File changed on disk. Buffer reloaded.\" | echohl None",
  pattern = { "*" }
})

local custom_augroup = vim.api.nvim_create_augroup("custom", { clear = true })

-- enable spellchecking for these filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "lua", "cpp", "bash" },
  command = "setlocal spell",
  group = custom_augroup,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "d" },
  command = "setlocal commentstring=//\\ %s",
  group = custom_augroup,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cqlang" },
  command = "set ft=python",
  group = custom_augroup,
})
