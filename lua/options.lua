-- Add any additional options here
-- see:
-- :help nvim.o
-- :help nvim.opt

-- Soft wrap at 90 characters
-- Do not hard wrap
vim.opt.colorcolumn = "90"
vim.opt.wrap = true              -- Turn on soft wrap
vim.opt.linebreak = true         -- Don't break words in the middle
vim.opt.breakindent = true       -- Wrapped lines keep the same indent level
vim.opt.textwidth = 0           -- Ensure NO hard breaks are inserted
-- vim.opt.columns = 90

-- Set highlight on search
vim.opt.hlsearch = true

-- Show line numbers
vim.wo.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
-- 'a' means 'all modes'; can se to n, v, i, etc.
vim.o.mouse = "a"

-- Sync OS/neovim clipboard
-- see :help clipboard
-- vim.o.clipboard = 'unnamedplus'

-- Visually indent wrapped lines
vim.o.breakindent = true

-- Save undo history into a file
vim.o.undofile = true

-- Case-insensitive searching
-- use \C to force case-sensitive
vim.o.ignorecase = true
-- automatically search case-sensitive if an uppercase letter is used
vim.o.smartcase = true

-- Display signcolumn always
vim.wo.signcolumn = "yes"

-- Reduce update times
-- ! check documentation
-- Time to save to swap
vim.o.updatetime = 250
-- Time to autocomplete
vim.o.timeoutlen = 300

-- Better completions
vim.o.completeopt = "menuone,preview,noselect"

-- Better colors, if terminal supports it
-- vim.o.termguicolors = true
