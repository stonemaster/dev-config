return {
  {
    "TheNoeTrevino/haunt.nvim",
    -- default config: change to your liking, or remove it to use defaults
    ---@class HauntConfig
    opts = {
      sign = "󱙝",
      sign_hl = "DiagnosticInfo",
      virt_text_hl = "HauntAnnotation", -- links to DiagnosticVirtualTextHint
      annotation_prefix = " 󰆉 ",
      annotation_suffix = "",
      line_hl = nil,
      virt_text_pos = "eol",
      data_dir = nil,
      per_branch_bookmarks = true,
      picker = "auto", -- "auto", "snacks", "telescope", or "fzf"
      picker_keys = { -- picker agnostic, we got you covered
        delete = { key = "d", mode = { "n" } },
        edit_annotation = { key = "a", mode = { "n" } },
      },
    },
    -- recommended keymaps, with a helpful prefix alias
    init = function()
      local haunt = require("haunt.api")
      local haunt_picker = require("haunt.picker")
      local map = vim.keymap.set
      local prefix = "<leader>h"

      -- annotations
      map("n", prefix .. "a", function()
        haunt.annotate()
      end, { desc = "Annotate" })

      map("n", prefix .. "t", function()
        haunt.toggle_annotation()
      end, { desc = "Toggle annotation" })

      map("n", prefix .. "T", function()
        haunt.toggle_all_lines()
      end, { desc = "Toggle all annotations" })

      map("n", prefix .. "d", function()
        haunt.delete()
      end, { desc = "Delete bookmark" })

      map("n", prefix .. "C", function()
        haunt.clear_all()
      end, { desc = "Delete all bookmarks" })

      -- move
      map("n", prefix .. "p", function()
        haunt.prev()
      end, { desc = "Previous bookmark" })

      map("n", prefix .. "n", function()
        haunt.next()
      end, { desc = "Next bookmark" })

      -- picker
      map("n", prefix .. "l", function()
        haunt_picker.show()
      end, { desc = "Show Picker" })

      -- quickfix
      map("n", prefix .. "q", function()
        haunt.to_quickfix()
      end, { desc = "Send Hauntings to QF Lix (buffer)" })

      map("n", prefix .. "Q", function()
        haunt.to_quickfix({ current_buffer = true })
      end, { desc = "Send Hauntings to QF Lix (all)" })

      -- yank
      map("n", prefix .. "y", function()
        haunt.yank_locations({ current_buffer = true })
      end, { desc = "Send Hauntings to Clipboard (buffer)" })

      map("n", prefix .. "Y", function()
        haunt.yank_locations()
      end, { desc = "Send Hauntings to Clipboard (all)" })
    end,
  },

  -- Interacting with and manipulating marks
  {
    "chentoast/marks.nvim",
    event = "FileType",
    keys = {
      { "m/", "<cmd>MarksListAll<CR>", desc = "Marks from all opened buffers" },
    },
    opts = {
      sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
      bookmark_1 = { sign = "󰈼" }, -- ⚐ ⚑ 󰈻 󰈼 󰈽 󰈾 󰈿 󰉀
      mappings = {
        annotate = "m<Space>",
      },
    },
  },

  -- MiniHarp
  -- {
  --   "vieitesss/miniharp.nvim",
  --   version = "*", -- latest stable release
  --   -- branch = 'main', -- latest nightly version
  --   opts = {
  --     autoload = true,
  --     autosave = true,
  --     show_on_autoload = false,
  --     ui = {
  --       position = "center", -- `top-left`, `top-right`, `bottom-left`, `bottom-right`.
  --       show_hints = true,
  --       enter = true, -- Whether to enter the floating window or not
  --     },
  --   },
  --   keys = {
  --     {
  --       "<leader>h",
  --       function()
  --         require("miniharp").toggle_file()
  --       end,
  --       desc = "miniharp: toggle file mark",
  --     },
  --     {
  --       "<C-n>",
  --       function()
  --         require("miniharp").next()
  --       end,
  --       desc = "miniharp: next file mark",
  --     },
  --     {
  --       "<C-p>",
  --       function()
  --         require("miniharp").prev()
  --       end,
  --       desc = "miniharp: prev file mark",
  --     },
  --     {
  --       "<leader>H",
  --       function()
  --         require("miniharp").show_list()
  --       end,
  --       desc = "miniharp: toggle marks list",
  --     },
  --     -- {
  --     --   "<leader>H",
  --     --   function()
  --     --     require("miniharp").enter_list()
  --     --   end,
  --     --   desc = "miniharp: enter marks list",
  --     -- },
  --     {
  --       "<leader>1",
  --       function()
  --         require("miniharp").go_to(1)
  --       end,
  --       desc = "miniharp: go to mark 1",
  --     },
  --     {
  --       "<leader>2",
  --       function()
  --         require("miniharp").go_to(2)
  --       end,
  --       desc = "miniharp: go to mark 2",
  --     },
  --     {
  --       "<leader>3",
  --       function()
  --         require("miniharp").go_to(3)
  --       end,
  --       desc = "miniharp: go to mark 3",
  --     },
  --     {
  --       "<leader>4",
  --       function()
  --         require("miniharp").go_to(4)
  --       end,
  --       desc = "miniharp: go to mark 4",
  --     },
  --   },
  -- },
}
