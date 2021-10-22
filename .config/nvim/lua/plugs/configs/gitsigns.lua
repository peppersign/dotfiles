-- Gitsigns

-- This just fixes some issues with the gruvbox color scheme
vim.api.nvim_exec(
[[
hi GitAdd guifg=#b8bb26 guibg=#282828
hi GitChange guifg=#83a598 guibg=#282828
hi GitRemove guifg=#fb4934 guibg=#282828
hi SignColumn guibg=#282828
]],
false
)

require('gitsigns').setup {
    signs = {
        add          = {hl = 'GitAdd'   , text = ' +', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitChange', text = ' ~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitRemove', text = ' -', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitRemove', text = ' -', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitChange', text = ' -', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },

    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,

    keymaps = {
        noremap = true,
        -- I won't use these unless one day I start working on a large pr lol
    },

    watch_gitdir = {
        interval = 1000,
        follow_files = true
    },

    attach_to_untracked = true,
    current_line_blame = false,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000
    },
    current_line_blame_formatter_opts = {
        relative_time = false
    },

    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    yadm = {
        enable = false
    }
}
