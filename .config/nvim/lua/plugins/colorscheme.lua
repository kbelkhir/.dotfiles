return {
  { "Mofiqul/vscode.nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "rose-pine/neovim",
    variant = "main",
    name = "rose-pine",
    opts = {
      palette = {
        main = {
          --base = "#191724",
          base = "#000000",
          panel = "#000000",
        },
      },
      highlight_groups = {
        --  String = { fg = "#CE9178" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
