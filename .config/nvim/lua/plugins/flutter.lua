return {
  -- Dart LSP
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function()
  --     require("lspconfig").dartls.setup({
  --       cmd = { "dart", "language-server", "--protocol=lsp" },
  --     })
  --   end,
  -- },
  -- -- Flutter
  {
    "akinsho/flutter-tools.nvim",
    event = "BufEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
    keys = {
      { "<leader>Fr", "<cmd>FlutterRun<CR>", desc = "Flutter: Run" },
      { "<leader>Fd", "<cmd>FlutterOpenDevTools<CR>", desc = "Flutter: Open Dev tools" },
      { "<leader>Fl", "<cmd>FlutterLogToggle<CR>", desc = "Flutter: Toggle logs" },
      { "<leader>Fh", "<cmd>FlutterReload<CR>", desc = "Flutter: Hot reload" },
      { "<leader>Fs", "<cmd>FlutterRestart<CR>", desc = "Flutter: Hot restart" },
      { "<leader>Fq", "<cmd>FlutterQuit<CR>", desc = "Flutter: stop" },
    },
    opts = {
      hooks = function()
        require("flutter-tools").setup({
          debugger = {
            enabled = true,
            -- register_configurations = function(_)
            --   require("dap").configurations.dart = {}
            --   require("dap.ext.vscode").load_launchjs()
            -- end,
          },
          lsp = {
            color = { -- show the derived colours for dart variables
              enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
              background = true, -- highlight the background
              -- background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
              -- foreground = true, -- highlight the foreground
              --virtual_text = true, -- show the highlight using virtual text
              --virtual_text_str = "■", -- the virtual text character to highlight
            },
            -- settings = {
            --   analysisExcludedFolders = {},
            -- },
          },
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
  -- {
  --   "akinsho/pubspec-assist.nvim",
  --   event = "BufEnter",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   config = true,
  -- },
}
