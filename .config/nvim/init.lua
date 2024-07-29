-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local ok, err = pcall(require, "config.local")

if not ok then
  print("Error loading local config: " .. err)
end
