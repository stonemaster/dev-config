vim.api.nvim_command([[
  autocmd FileType d setlocal commentstring=//%s
]])

vim.api.nvim_command([[
  autocmd FileType md setlocal textwidth=80
]])

vim.api.nvim_command([[
  autocmd BufEnter *.rest set ft=http
]])

vim.api.nvim_command([[
  autocmd BufEnter *.arb set ft=json
]])
