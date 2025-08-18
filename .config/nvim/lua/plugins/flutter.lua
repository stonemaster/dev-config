return {
  -- Flutter
  {
    "akinsho/flutter-tools.nvim",
    event = "BufEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    opts = {
      hooks = function()
        require("flutter-tools").setup({
          -- dev_log = {
          -- 	enabled = true,
          -- 	notify_errors = true,
          -- 	open_cmd = "tabnew",
          -- },
        })
        -- require("telescope").load_extension("flutter")
      end,
    },
  },
}
