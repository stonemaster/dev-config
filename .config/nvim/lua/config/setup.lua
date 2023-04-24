local M = {}

-- Disable Q as quit windows shortcut
function M.override(user_opts)
  local opts = {
    defaults = {
      features = { window_q_mapping = false }
    }
  }
  return vim.tbl_deep_extend('force', user_opts or {}, opts)
end

return M
