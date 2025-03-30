-- Automatically change theme according to file type
local autothemes = vim.api.nvim_create_augroup("AutoThemes", {})

local languages = {
  js = "vscode",
  json = "vscode",
  css = "vscode",
  ts = "vscode",
  go = "catppuccin-mocha",
  templ = "catppuccin-mocha",
  swift = "everforest",
  py = "onedark",
  lua = "onedark",
  yaml = "everforest",
  yml = "everforest",
}

for lang, theme in pairs(languages) do
  vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*." .. lang,
    callback = function()
      pcall(vim.cmd, "colorscheme " .. theme)
      -- vim.cmd.colorscheme(theme)
    end,
    group = autothemes,
  })
end
