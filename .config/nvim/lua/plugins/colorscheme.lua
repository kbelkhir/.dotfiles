return {
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    opts = {
      -- Disable nvim-tree background color
      transparent = true,
      disable_nvimtree_bg = true,

      -- Override colors (see ./lua/vscode/colors.lua)
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      -- transparent_background = true,
      -- custom_highlights = {
      --   CursorLine = { bg = "#000000" },
      -- },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    -- priority = 1000,
    opts = {
      transparent = true,
      styles = {
        String = { fg = "#CE9178" },
      },
    },
  },
  {
    "rose-pine/neovim",
    priority = 1000,
    lazy = false,
    variant = "moon",
    name = "rose-pine",
    opts = {
      styles = {
        bold = true,
        italic = false,
        transparency = true,
      },
      palette = {},
      highlight_groups = {
        String = { fg = "#CE9178" },
        -- CursorLine = { bg = "base" },
        CursorLine = { bg = "" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine-moon",
    },
  },
}
