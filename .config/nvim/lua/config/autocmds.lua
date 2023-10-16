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
  pattern = { "python", "lua", "cpp", "bash", "dart" },
  command = "setlocal spell",
  group = custom_augroup,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "d" },
  command = "setlocal commentstring=//\\ %s",
  group = custom_augroup,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "kotlin" },
  command = "setlocal commentstring=//\\ %s",
  group = custom_augroup,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cqlang" },
  command = "set ft=python",
  group = custom_augroup,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "dart" },
  command = "setlocal shiftwidth=2 expandtab tabstop=2",
  group = custom_augroup,
})

-- TODO: Revert Dart treesitter performance problems.
-- until this one fixed: https://github.com/nvim-treesitter/nvim-treesitter/issues/4945
local parser = require("nvim-treesitter.parsers").get_parser_configs()
parser.dart = {
  install_info = {
    url = "https://github.com/UserNobody14/tree-sitter-dart",
    files = { "src/parser.c", "src/scanner.c" },
    revision = "8aa8ab977647da2d4dcfb8c4726341bee26fbce4", -- The last commit before the snail speed
  },
}

-- Set default colorscheme
vim.cmd([[colorscheme catppuccin-frappe]])
