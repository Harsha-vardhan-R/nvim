Navic = require("nvim-navic")

require('lualine').setup {
    options = {
        icons_enabled = true,
        component_separators = '',
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {'neo-tree', 'alpha'},
            winbar = {'neo-tree', 'alpha'},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 100,
            winbar = 100,
            tabline = 100
        }
    },
    sections = {
        lualine_a = { { 'mode', separator = { right = '' }} },
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {{ 'location', separator = { right = '', left='' }}}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {},
        lualine_z = {'location'}
    },
    -- tabline = {
    --     lualine_a = { 'buffers'},
    --     lualine_b = {},
    --     lualine_c = {},
    --     lualine_x = {},
    --     lualine_y = {},
    --     lualine_z = {},
    -- },
    winbar = {
        lualine_a = { { 'filename', separator = { left = '', right='' }, right_padding = 10 } },
        lualine_b = { 'Navic.get_location()' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    inactive_winbar = {
        lualine_a = { { 'filename', separator = { left = '', right='' }, right_padding = 10 } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    extensions = {
        'toggleterm',
        'neo-tree',
        'fugitive'
    }
}




