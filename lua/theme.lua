-- Automatically change theme according to file type
local autothemes = vim.api.nvim_create_augroup('AutoThemes', {})

local languages = {
  js = "vscode",
  json = "vscode",
  css = "vscode",
  go = "catppuccin-mocha",
  templ = "catppuccin-mocha",
  swift = "xcodedark",
  py = "onedark",
  lua = "onedark",
}

for lang, theme in pairs(languages) do
  vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*." .. lang,
    callback = function()
      pcall(vim.cmd, "colorscheme " .. theme)
      -- vim.cmd.colorscheme(theme)
    end,
    group = autothemes
  })
end
