-- Keybindings


vim.g.mapleader = ' '

local function map(mode, bind, action, opts)
    local defaults = opts or {noremap=true, silent=true}
    vim.api.nvim_set_keymap(mode, bind, action, defaults)
end


--Editor
map('n', 'zz', ':update<cr>')
map('n', '<leader>qq', ':q<cr>')
map('n', '<leader>ff', ':Telescope find_files<cr>')
map('n', '<C-t>', ':NvimTreeToggle<cr>')
map('n', '<C-s>', ':source ~/vim_session<cr>')

--Text
map('n', '-', '<End>')

--Buffers
map('n', 'gt', ':BufferLineCycleNext<cr>')
map('n', '<leader>k', ':BufferLineCycleNext<cr>')
map('n', '<leader>j', ':BufferLineCyclePrev<cr>')
map('n', '<leader>t', ':enew<cr>')

--Clipboard
map('n', '<leader>y', '"+y<cr>' )

