return {
  -- Git History in nice
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
    keys = {
      { "<leader>gl", "<cmd>Flog<CR>", desc = "Git log using Flog" },
    },
  },

  -- Pleasant Git commit messages
  {
    "rhysd/committia.vim",
    -- Taken from rafi/vim-config
    event = "BufReadPre COMMIT_EDITMSG",
    init = function()
      -- See: https://github.com/rhysd/committia.vim#variables
      vim.g.committia_min_window_width = 30
      vim.g.committia_edit_window_width = 75
    end,
    config = function()
      vim.g.committia_hooks = {
        edit_open = function()
          vim.cmd.resize(10)
          local opts = {
            buffer = vim.api.nvim_get_current_buf(),
            silent = true,
          }
          local function map(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, opts)
          end
          map("n", "q", "<cmd>quit<CR>")
          map("i", "<C-d>", "<Plug>(committia-scroll-diff-down-half)")
          map("i", "<C-u>", "<Plug>(committia-scroll-diff-up-half)")
          map("i", "<C-f>", "<Plug>(committia-scroll-diff-down-page)")
          map("i", "<C-b>", "<Plug>(committia-scroll-diff-up-page)")
          map("i", "<C-j>", "<Plug>(committia-scroll-diff-down)")
          map("i", "<C-k>", "<Plug>(committia-scroll-diff-up)")
        end,
      }
    end,
  },

  -- Neogit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      -- Note: taken from https://github.com/NeogitOrg/neogit
      "ibhagwan/fzf-lua",
    },
    opts = {
      status = {
        recent_commit_count = 100,
      },
    },
    keys = {
      { "<leader>gn", "<cmd>Neogit<CR>" },
    },
  },
}
