local function config()
    -- local function on_attach(client, bufnr)
    --     -- print('Diagnostics plugin: Attached to ' .. client.name .. ' in ' .. vim.api.nvim_buf_get_name(bufnr))
    -- end

    local dlsconfig = require('diagnosticls-configs')
    local pylint = require 'diagnosticls-configs.linters.pylint'
    local black = require 'diagnosticls-configs.formatters.black'
    -- dlsconfig.init {
    --     on_attach = on_attach,
    -- }
    dlsconfig.setup {
        ['python'] = {
            linter = pylint,
            formatter = black,
        },
    }
end

return {
    'creativenull/diagnosticls-configs-nvim',
    requires = {
        'neovim/nvim-lspconfig',
    },
    config = config,
}
