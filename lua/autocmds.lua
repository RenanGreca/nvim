-- Add any additional autocmds here

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Autoformat Go files on save ]]
local format_sync_group = vim.api.nvim_create_augroup('GoFormat', {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_group
})


-- [[ Autoformat Python files on save ]]
local format_python_group = vim.api.nvim_create_augroup("AutoFormat", {})
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  callback = function()
    vim.cmd("silent !black --quiet %")
    vim.cmd("edit")
  end,
  group = format_python_group
})

