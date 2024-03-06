local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4

-- Override rafi default to not open vsplits
-- default currently is: set switchbuf=useopen,vsplit
--  Jump to the first open window
opt.switchbuf = 'usetab'
opt.autowrite = true
opt.number = true

-- Commands to generate pyenv:
-- `python3 -m venv py-nvim`
vim.g.python3_host_prog = 'py-nvim/bin/python3'
-- Has to be `nil` instead of 1, see https://github.com/NvChad/NvChad/issues/1417
vim.g.loaded_python3_provider = nil
