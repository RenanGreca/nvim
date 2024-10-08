return {
  "ray-x/go.nvim",
  dependencies = {  -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup({
      lsp_codelens = false,
      lsp_inlay_ints = {
        enabled = false,
      },
    })
    vim.keymap.set('n', 'K', ':GoDoc<cr>')
  end,
  event = {"CmdlineEnter"},
  ft = {"go", 'gomod', 'templ' },
  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
