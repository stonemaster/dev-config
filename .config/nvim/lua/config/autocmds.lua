vim.api.nvim_command([[
  autocmd FileType d setlocal commentstring=//%s
]])

vim.api.nvim_command([[
  autocmd FileType md setlocal textwidth=80
]])
