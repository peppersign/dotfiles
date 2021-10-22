--[[
File manager

Expect this not to work as intended, nvim-tree is
currently migrating global-based options to the setup 
function.
--]]


local g = vim.g

g.nvim_tree_ignore = { '.git', '.cache' }
g.nvim_tree_gitignore = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" } --This line has been stolen from nvchad by the mickey mouse hacker squadron

g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 0
}


local tree_cb = require('nvim-tree.config').nvim_tree_callback
local keybinds = {
    {key = 'q', cb = tree_cb('close')}, --Tree keybinds
    {key = 'R', cb = tree_cb('refresh')},
    {key = '?', cb = tree_cb('toggle_help')},
    {key = {"<2-RightMouse>", "<C-]>"}, cb = tree_cb("cd")},
    {key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
    {key = 's', cb = tree_cb('vsplit')}, --File interaction
    {key = 'i', cb = tree_cb('split')},
    {key = 't', cb = tree_cb('tabnew')},
    {key = 'y', cb = tree_cb('copy_name')}, --Utilities
    {key = 'Y', cb = tree_cb('copy_path')} 
}


require('nvim-tree').setup {
    ignore_ft_on_setup = {},
    disable_netrw = false,
    hijack_netrw = true,
    open_on_setup = false,
    update_cwd = true,
    auto_close = true,
    view = {
        width = 30,
        height = 30,
        side = 'left',
        auto_resize = true,
        mappings = {
            custom_only = true,
            list = keybinds  
        }
    }
}

