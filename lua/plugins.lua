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
    nowait = true
  }
end

require("lazy").setup({
  -- Theme
  -- Default to catppucin.
  -- Install others for different situations (see theme.lua)
  require 'config.catppuccin',
  'Mofiqul/vscode.nvim',
  'navarasu/onedark.nvim',
  '2giosangmitom/nightfall.nvim',
  'arzg/vim-colors-xcode',

  -- Git
  -- ! What do these do?
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  {
    -- Display git signs in left gutter
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelte = { text = '~' },
      },
    },
    -- Additional git navigation and actions in kickstart package
  },
  -- Tabstop and shiftwidth detection
  "tpope/vim-sleuth",
  -- Center cursor
  {
    "arnamak/stay-centered.nvim",
    opts = {}
  },

  {
    -- Configures the statusline (above the commandline)
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    -- Indentation guides
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  {
    -- Comment/uncomment shortcut
    'numToStr/Comment.nvim',
    opts = {},
  },


  {
    -- Syntax highlighting and code navigation
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'bash',
        'lua',
        'javascript',
        'typescript',
        'json',
        'markdown',
        'vim',
        'html',
      }
    }
  },

  -- WhichKey & related keymaps
  require('plugin.whichkey'),
  -- Autocompletion
  require('plugin.nvim-cmp'),
  -- LSP
  require('plugin.lsp'),
  -- file finder
  require('plugin.telescope'),
  -- file navigator
  require('plugin.nvim-tree'),
  -- GitHub copilot
  -- require('config/copilot'),
  require('plugin.supermaven'),
  -- code autocompletion
  -- require('plugin.coc'),

  require('plugin.go'),
  require('plugin.rust'),
  require('plugin.pkl'),
  -- require('plugin.obsidian'),
  require('plugin.markdown'),
  require('plugin.neotest'),
  -- require('plugin.wilder'),
  require('plugin.tabset'),
  require('plugin.harpoon'),
  require('plugin.dbtpal'),
  require('plugin.toggleterm'),
},
-- ! what is the second parameter?
{})
