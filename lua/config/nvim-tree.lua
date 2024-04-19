local function config()
    require("nvim-tree").setup {  
        on_attach = on_attach 
    }
    local api = require("nvim-tree.api")

    local function on_attach(bufnr)
        api.config.mappings.default_on_attach(bufnr)
    end

    local function edit_or_open()
        local node = api.tree.get_node_under_cursor()
        if node.nodes ~= nil then     -- expand or collapse folder
            api.node.open.edit()
        else     -- open file     
            api.node.open.edit()     -- Close the tree if file was opened     
            api.tree.close()   
        end 
    end  

    -- open as vsplit on current node 
    local function vsplit_preview()   
        local node = api.tree.get_node_under_cursor()    
        if node.nodes ~= nil then     -- expand or collapse folder     
            api.node.open.edit()   
        else     -- open file as vsplit     
            api.node.open.vertical()   
        end    -- Finally refocus on tree if it was lost   
        api.tree.focus() 
    end

    -- vim.keymap.set('n', '<Leader>e', api.tree.toggle, opts('NvimTree', 'Toggle'))
    local keymaps = {
        ["e"] = {
            api.tree.toggle,
            Hint(require('icons').ui.Tree, "Tree toggle"),
        },
    }

    local wk = require('which-key')
    wk.register(keymaps, {prefix = "<leader>" })
end

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = config,
    enabled = true,
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    event = "User DirOpened",
}
