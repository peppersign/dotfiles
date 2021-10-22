-- Treesitter

local ts = require 'nvim-treesitter.configs'
ts.setup {
    ensure_installed = 'maintained',
    highlight = {enable = true, additional_vim_regex_highlighting = false}
}
