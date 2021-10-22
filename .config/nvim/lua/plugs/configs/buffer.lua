-- Bufferline

require('bufferline').setup {
    options = {
        separator_style = 'slant',
        close_icon = '',

        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                highlight = 'Directory',
                text_align = 'center'
            }
        }
    }
}

