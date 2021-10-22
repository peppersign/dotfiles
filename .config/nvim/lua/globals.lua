--Global options

local set = vim.opt
local g = vim.g

set.termguicolors = true
set.autoindent = true
set.cursorline = true
set.laststatus = 2
set.number = true
set.mouse = "a"
set.wrap = false
set.guicursor = "a:hor30-blinkwait5000-blinkon4000-blinkoff4000-nCursor"

set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.scrolloff = 999

-- Sessions handling
set.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize'
vim.api.nvim_exec(
[[
autocmd! VimLeave * mksession! /home/senkoloaf/vim_session
]],
false)

-- Colorscheme
g.gruvbox_material_disable_italic_comment = 1
g.gruvbox_material_enable_bold = 1
g.gruvbox_material_background = 'medium'

vim.cmd('colorscheme gruvbox-material')

