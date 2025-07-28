return {
  {
    "Everblush/nvim",
    name = "everblush",
    opts = {
      override = {
        SupermavenSuggestion = { fg = "#FFA500" },
        LineNr = { fg = "#cccccc" },
        CursorLineNr = { fg = "#FFFFFF" },
        LspInlayHintxxx = { fg = "#777777" },
        SnacksDashboardHeader = { fg = "#ef426f" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everblush",
    },
  },
  {
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function() end,
  },
}
