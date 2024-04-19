-- To install coc.nvim, run the following command:
-- :call coc#util#install()
return {
    'neoclide/coc.nvim',
    branch = 'release',
    dependencies = {
        'HerringtonDarkholme/yats.vim',
    },
    config = function()
        -- Below mapping not working -- ctrl-y works.
        vim.keymap.set({"i"}, "<c-@>", "coc#refresh()", {silent=true, expr=true})
    end,
}

-- Plugins:
-- for TypeScript/JavaScript
-- :CocInstall coc-tsserver
-- :CocInstall coc-tslint-plugin
-- :CocInstall coc-eslint
