-- Add any additional keymaps here

-- Set <leader> key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- prevent default behavior of space
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent = true})

-- vim.keymap.set("n", "v", "viw") -- Select current word
-- Clipboard shortcuts
if vim.g.vscode then
  -- for some reason, vscode doesn't like the decriptions
  vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
  vim.keymap.set({"n", "v"}, "<C-a>", [[:%y+<CR>]])
else
  vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {
    desc = 'Copy to system clipboard',
  })
  vim.keymap.set({"n", "v"}, "<C-a>", [[:%y+<CR>]], {
    desc = 'Copy entire file contents to system clipboard',
  })
end

-- By default, don't store a copy when deleting lines/words/characters
-- vim.keymap.set({"n","v"}, "x", [["_x]])
-- vim.keymap.set({"n","v"}, "d", [["_d]])
-- vim.keymap.set({"n","v"}, "D", [["_D]])

-- Use <leader>[command] in order to store a copy (cut)
-- vim.keymap.set({"n","v"}, "<leader>x", [[""x]], {
--   desc = 'Cut selected text',
-- })
-- vim.keymap.set({"n","v"}, "<leader>d", [[""d]], {
--   desc = 'Cut selected text',
-- })
-- vim.keymap.set({"n","v"}, "<leader>D", [[""D]], {
--   desc = 'Cut current line',
-- })

-- Swap behavior of [] and {}
vim.keymap.set({"n","v"}, "{", "[")
vim.keymap.set({"n","v"}, "[", "{")
vim.keymap.set({"n","v"}, "}", "]")
vim.keymap.set({"n","v"}, "]", "}")

-- Shortcut for nvim-tree
-- vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})  
-- vim.keymap.set("n", "l", edit_or_open,          "Edit Or Open")
-- vim.keymap.set("n", "L", vsplit_preview,        "Vsplit Preview")
-- vim.keymap.set("n", "h", api.tree.close,        "Close")
-- vim.keymap.set("n", "H", api.tree.collapse_all, "Collapse All")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Autoindent shortcuts
vim.keymap.set('v', '<Tab>', '>gv', {
  desc = 'Indent selected lines',
  silent = true
})
vim.keymap.set('v', '<S-Tab>', '<gv', {
  desc = 'Unindent selected lines',
  silent = true
})
vim.keymap.set('n', '<Tab>', '>>', {
  desc = 'Indent current line',
  silent = true
})
vim.keymap.set('n', '<S-Tab>', '<<', {
  desc = 'Unindent current line',
  silent = true
})
-- vim.keymap.set('n', '<Leader><Tab>', 'gg=G', {
--   desc = 'Autoindent entire file',
--   silent = true
-- })
