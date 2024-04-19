-- Add any additional options here
-- see: 
-- :help nvim.o
-- :help nvim.opt

vim.opt.colorcolumn = "80"
vim.opt.textwidth = 120
vim.opt.wrap = true

-- Set highlight on search
vim.opt.hlsearch = true

-- Show line numbers
vim.wo.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
-- 'a' means 'all modes'; can se to n, v, i, etc.
vim.o.mouse = 'a'

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
vim.wo.signcolumn = 'yes'


-- Reduce update times 
-- ! check documentation
-- Time to save to swap
vim.o.updatetime = 250
-- Time to autocomplete
vim.o.timeoutlen = 300

-- Better completions
vim.o.completeopt = 'menuone,preview,noselect'

-- Better colors, if terminal supports it
-- vim.o.termguicolors = true
