local config = function()
    local lint = require('lint')
    lint.linters_by_ft = {
        python = {'pylint'},
    }

    vim.api.nvim_create_autocmd({"BufWritePost"}, {
        callback = function()
            lint.try_lint()
        end,
    })
    lint.linters.pylint.cmd = 'python'
    lint.linters.pylint.args = {'-m', 'pylint', '-f', 'json'}

end

return {
    'mfussenegger/nvim-lint',
    config = config,
}
