return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      -- Change the default chat adapter
      chat = {
        adapter = "deepseek",
        slash_commands = {
          ["file"] = {
            opts = {
              provider = "fzf_lua",
            },
          },
          ["buffer"] = {
            opts = {
              provider = "fzf_lua",
            },
          },
        },
      },
      inline = {
        adapter = "copilot",
      },
    },
    adapters = {
      deepseek = function()
        return require("codecompanion.adapters").extend("deepseek", {
          schema = {
            model = {
              default = "deepseek-chat",
            },
          },
          env = {
            api_key = "cmd:echo $DEEPSEEK_API_KEY",
          },
        })
      end,
    },
  },
}
