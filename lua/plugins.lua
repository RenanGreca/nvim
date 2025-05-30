-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

function opts(name, desc)
  return {
    desc = name .. ": " .. desc,
    -- buffer = bufnr,
    noremap = true,
    silent = true,
    nowait = true,
  }
end

require("lazy").setup(
  {
    -- Theme
    -- Default to catppucin.
    -- Install others for different situations (see theme.lua)
    require("config.catppuccin"),
    "Mofiqul/vscode.nvim",
    "navarasu/onedark.nvim",
    "2giosangmitom/nightfall.nvim",
    "neanias/everforest-nvim",

    -- Git
    -- ! What do these do?
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    {
      -- Display git signs in left gutter
      "lewis6991/gitsigns.nvim",
      opts = {
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelte = { text = "~" },
        },
      },
      -- Additional git navigation and actions in kickstart package
    },
    -- Tabstop and shiftwidth detection
    "tpope/vim-sleuth",
    -- Center cursor
    {
      "arnamak/stay-centered.nvim",
      opts = {},
    },

    {
      -- Configures the statusline (above the commandline)
      "nvim-lualine/lualine.nvim",
      opts = {
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = "|",
          section_separators = "",
        },
      },
    },
    {
      -- Comment/uncomment shortcut
      "numToStr/Comment.nvim",
      opts = {},
    },

    {
      -- Syntax highlighting and code navigation
      "nvim-treesitter/nvim-treesitter",
      dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
      build = ":TSUpdate",
      opts = {
        ensure_installed = {
          "bash",
          "lua",
          "javascript",
          "typescript",
          "json",
          "markdown",
          "vim",
          "html",
        },
      },
      setup = function()
        require("config.treesitter.configs").setup({
          indent = {
            enable = true,
            disable = { "yaml" },
          },
        })
      end,
    },

    -- WhichKey & related keymaps
    require("plugin.whichkey"),
    -- Autocompletion
    -- require("plugin.nvim-cmp"),
    require("plugin.blink"),
    require("plugin.supermaven"),
    -- LSP
    require("plugin.lsp"),
    -- file finder
    require("plugin.telescope"),
    -- file navigator
    require("plugin.nvim-tree"),
    -- GitHub copilot
    -- require('config/copilot'),
    -- code autocompletion
    -- require('plugin.coc'),

    -- Language helpers
    require("plugin.go"),
    require("plugin.rust"),
    require("plugin.pkl"),
    -- require('plugin.obsidian'),
    require("plugin.markdown"),

    -- Unit test runner
    require("plugin.neotest"),
    -- dbt helper commands
    require("plugin.dbtpal"),

    -- Vim command autocompletion
    require("plugin.wilder"),
    require("plugin.tabset"),

    -- Mark and return to locations
    require("plugin.harpoon"),
    -- require("plugin.toggleterm"),

    -- Autoformatter
    require("plugin.conform"),
    -- require('plugin.indent'),
    require("plugin.snacks"),
    -- 'nathanaelkane/vim-indent-guides',
    -- Quickfix and diagnostic toggler
    require("plugin.trouble"),
    require("plugin.codecompanion"),
    require("plugin.wrapping"),

    require("plugin.macros"),
  },
  -- ! what is the second parameter?
  {}
)
