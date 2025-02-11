return {
  {
    "Everblush/nvim",
    name = "everblush",
    opts = {
      override = {
        SupermavenSuggestion = { fg = "#FFA500" },
        LineNr = { fg = "#cccccc" },
        CursorLineNr = { fg = "#FFFFFF" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everblush",
    },
  },
}
