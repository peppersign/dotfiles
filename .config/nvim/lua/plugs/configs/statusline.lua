-- Statusline

local gl = require('galaxyline')


local colors = {
    yellow = '#d79921',
    greenb = '#b8bb26',
    green = '#98971a',
    blue = '#458588',
    cyan = '#689d6a',
    red = '#cc241d',
    bg = '#fbf1c7',
    bg2 = '#7c6f64',
    bg_alt = '#282828',
    fg = '#3c3836'
}


local modes = {
    n = colors.green,
    i = colors.blue,
    v = colors.cyan,
    R = colors.red
}


gl.short_line_list = {'NvimTree'}

gl.section.left[1] = {
    StartBorder = {
        provider = function() return " " end,
        highlight = {colors.bg, colors.bg}
    }
}


gl.section.left[2] = {
    ViMode = {
        provider = function()
            local name = {
                n = 'NORMAL',
                i = 'INSERT',
                v = 'VISUAL',
                V = 'VISUAL',
                R = 'REPLACE'
            }
            setmetatable(name, {__index = ' NORMAL '})
    
            local mode = name[vim.fn.mode()]
            vim.api.nvim_command(string.format('hi GalaxyViMode guifg=%s', modes[vim.fn.mode()]))
            return string.format(" %s ", mode)
        end,
        separator = "",
        separator_highlight = function()
            if require('galaxyline.condition').check_git_workspace == true then
                return {colors.bg, colors.green}
            end
            return {colors.bg, colors.bg_alt}
        end,
        highlight = {modes[vim.fn.mode()], colors.bg}
        
     }
}


gl.section.left[3] = {
    DiffAdd = {
        provider = 'DiffAdd',
        icon = ' +',
        condition = require('galaxyline.condition').check_git_workspace,
        highlight = {colors.fg, colors.green},
        separator = "",
        separator_highlight = {colors.green, colors.red}
    }  
}


gl.section.left[4] = {
    DiffRemove = {
        provider = 'DiffRemove',
        icon = ' -',
        condition = require('galaxyline.condition').check_git_workspace,
        highlight = {colors.fg, colors.red},
        separator = "",
        separator_highlight = {colors.red, colors.blue}
    }
}


gl.section.left[5] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = require('galaxyline.condition').check_git_workspace,
        highlight = {colors.fg, colors.blue},
        icon = "  ",
        separator = "",
        separator_highlight = {colors.blue, colors.bg_alt}
    }
}


gl.section.right[3] = {
    LinePercent = {
        provider = 'LinePercent',
        icon = '  ',
        separator = '',
        separator_highlight = {colors.bg2, colors.greenb},
        highlight = {colors.fg, colors.bg2}
    }
}


gl.section.right[2] = {
    FileName = {
        provider = 'FileName',
        separator = '',
        separator_highlight = {colors.greenb, colors.green},
        highlight = {colors.fg, colors.greenb}
    } 
}


gl.section.right[1] = {
    FileIcon = {
        provider = 'FileIcon',
        separator = ' ',
        separator_highlight = {colors.green, colors.green},
        highlight = {colors.fg, colors.green}
    }
}


gl.section.right[0] = {
    FileTypeName = {
        provider = 'FileTypeName',
        separator = '',
        separator_highlight = {colors.green, colors.bg_alt},
        highlight = {colors.fg, colors.green}
    }
}
