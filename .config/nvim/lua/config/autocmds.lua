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

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})

local custom_augroup = vim.api.nvim_create_augroup("custom", { clear = true })

-- enable spellchecking for these filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "lua", "cpp", "bash" },
  command = "setlocal spell",
  group = custom_augroup,
})
