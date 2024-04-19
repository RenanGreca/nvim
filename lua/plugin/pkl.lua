return {
  "apple/pkl-neovim",
  config = function ()
    local hasConfigs, configs = pcall(require, "nvim-treesitter.configs")
    if hasConfigs then
      configs.setup {
        ensure_installed = "pkl",
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      }
    end
  end,
}
