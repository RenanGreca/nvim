local function config()
  local wilder = require('wilder')
  wilder.setup({modes = {':', '/', '?'}})

  wilder.set_option('renderer', wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme({
      highlights = {
        -- highlight theme for the border
        border = 'Normal',
      },
      -- single, double, rounded or solid
      border = 'single',
      highlighter = wilder.basic_highlighter(),
      pumblend = 20,
      left = {' ', wilder.popupmenu_devicons()},
      right = {' ', wilder.popupmenu_scrollbar()},

    })
  ))
end

-- If :e results in an error, try :UpdateRemotePlugins and restart neovim
return {
  'gelguy/wilder.nvim',
  dependencies = {
    -- For python fuzzy thingies, disable on windows?
    'roxma/nvim-yarp',
    'roxma/vim-hug-neovim-rpc'
  },
  config = config,
}
