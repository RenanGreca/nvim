print('init.lua')

require('keymaps')
require('options')
require('autocmds')
require('theme')

vim.g.python3_host_prog = '/Users/renangreca/.pyenv/shims/python'

if vim.g.vscode then
  -- VSCode extension
  require('plugins.vscodecolors')
else
  require('plugins')
end
