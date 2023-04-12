local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4

-- Override rafi default to not open vsplits
-- default currently is: set switchbuf=useopen,vsplit
--  Jump to the first open window
opt.switchbuf = 'usetab'
opt.autowrite = true
opt.number = true
