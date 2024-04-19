-- local vscode = require('vscode-neovim')

-- vim.api.nvim_create_autocmd({"ModeChanged"}, {
--     pattern = {"*:[vV\x16]*"},
--     callback = function() vim.api.nvim_exec([[call VSCodeNotify('nvim-theme.visual')]], true) end,
--     -- callback = function() vscode.notify('nvim-theme.visual') end,
-- })

vim.api.nvim_exec([[
    " THEME CHANGER
    function! SetCursorLineNrColorInsert(mode)
        " Insert mode: blue
        if a:mode == "i"
            call VSCodeNotify('nvim-theme.insert')

        " Replace mode: red
        elseif a:mode == "r"
            call VSCodeNotify('nvim-theme.replace')

        " Visual mode mode: purple
        elseif a:mode == "v"
            call VSCodeNotify('nvim-theme.visual')
        
        elseif a:mode == "n"
            call VSCodeNotify('nvim-theme.normal')
        endif
    endfunction

    augroup CursorLineNrColorSwap
        autocmd!
        autocmd ModeChanged *:[vV\x16]* call VSCodeNotify('nvim-theme.visual')
        autocmd ModeChanged *:[R]* call VSCodeNotify('nvim-theme.replace')
        autocmd InsertEnter * call SetCursorLineNrColorInsert(v:insertmode)
        autocmd InsertLeave * call VSCodeNotify('nvim-theme.normal')
        autocmd CursorHold * call VSCodeNotify('nvim-theme.normal')
        autocmd ModeChanged [vV\x16]*:* call VSCodeNotify('nvim-theme.normal')
    augroup END
]], false)