local prefix = "<Leader>a"
return {
  -- GitHub Copilot
  --
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      model = "gpt-5.3-codex",
      window = {
        -- layout = "float", -- 'vertical', 'horizontal', 'float'
        width = 0.5, -- 50% of screen width
      },
      -- model = "gemini-3-pro-preview",
      sticky = "#buffer:listed",
      mappings = {
        show_diff = {
          full_diff = true,
        },
        reset = {
          normal = "<C-n>",
          insert = "<C-n>",
        },
      },
      prompts = {
        AddImports = {
          prompt = "Add necessary imports to the current file.",
        },
      },
      providers = {
        llama = {
          get_url = function(opts)
            return "http://localhost:8001/v1/chat/completions"
          end,
          get_headers = function()
            return { ["Authorization"] = "Bearer " .. "" }
          end,
          get_models = function()
            return { { id = "llama", name = "Running locally on port 8001" } }
          end,
          prepare_input = require("CopilotChat.config.providers").copilot.prepare_input,
          prepare_output = require("CopilotChat.config.providers").copilot.prepare_output,
        },
      },
    },
  },
  -- Code Companion
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    -- Expand 'cc' into 'CodeCompanion' in the command line
    init = function()
      vim.cmd([[cab cc CodeCompanion]])
    end,
    keys = {
      { "<leader>ac", "<cmd>CodeCompanionChat Toggle<CR>", desc = "Code CodeCompanion Chat" },
      { "<leader>at", "<cmd>CodeCompanionActions<CR>", desc = "Code CodeCompanion Actions" },
      { "ga", "<cmd>CodeCompanionChat Add<CR>", mode = "v", desc = "Code CodeCompanion Actions" },
    },
    opts = {
      adapters = {
        http = {
          opencode_http = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                api_key = "OPENCODE_API_KEY",
                url = "https://opencode.ai/zen/go",
              },
              schema = {
                model = {
                  default = "qwen3.6-plus",
                },
              },
            })
          end,
        },
      },

      interactions = {
        inline = {
          adapter = "opencode_http",
        },
        chat = {
          adapter = "opencode",
          model = "opencode-go/qwen3.6-plus",
        },
      },
    },
  },
  -- {
  --   "milanglacier/minuet-ai.nvim",
  --   lazy = false,
  --   config = function()
  --     require("minuet").setup({
  --       provider = "openai_compatible",
  --       request_timeout = 2.5,
  --       throttle = 1500, -- Increase to reduce costs and avoid rate limits
  --       debounce = 600,
  --       virtualtext = {
  --         auto_trigger_ft = {},
  --         keymap = {
  --           -- accept whole completion
  --           accept = "<A-A>",
  --           -- accept one line
  --           accept_line = "<A-a>",
  --           -- accept n lines (prompts for number)
  --           -- e.g. "A-z 2 CR" will accept 2 lines
  --           accept_n_lines = "<A-z>",
  --           -- Cycle to prev completion item, or manually invoke completion
  --           prev = "<A-[>",
  --           -- Cycle to next completion item, or manually invoke completion
  --           next = "<A-]>",
  --           dismiss = "<A-e>",
  --         },
  --       },
  --       provider_options = {
  --         openai_compatible = {
  --           api_key = "OPENCODE_API_KEY",
  --           end_point = "https://opencode.ai/zen/go/v1/chat/completions",
  --           model = "deepseek-v4-flash",
  --           name = "Opencode",
  --           optional = {
  --             max_tokens = 56,
  --             top_p = 0.9,
  --             -- disable thinking to avoid first token latency
  --             thinking = { type = "disabled" },
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },
}
