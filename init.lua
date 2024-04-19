print('init.lua')

require('keymaps')
require('options')
require('autocmds')

if vim.g.vscode then
  -- VSCode extension
  require('plugins.vscodecolors')
else
  require('plugins')
end
