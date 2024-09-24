Navic = require("nvim-navic")

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = bubbles_theme,
        component_separators = '',
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {'neo-tree'},
            winbar = {'neo-tree'},
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
        lualine_a = { { 'mode', separator = { left = ' ' }, right_padding = 10 } },
        lualine_b = {{'branch', 'diff', 'diagnostics', separator = '|||' }},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {{ 'location', separator = { right = ' ' }, left_padding = 10 }}
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
    --     lualine_a = {{ 'buffers', separator = { left = '┃', right = '┃' }, right_padding = 10 }},
    --     lualine_b = {},
    --     lualine_c = {},
    --     lualine_x = {},
    --     lualine_y = {},
    --     lualine_z = {},
    -- },
    winbar = {
        lualine_a = { { 'filename', separator = { left = ' ', right=' ' }, right_padding = 10 } },
        lualine_b = { 'Navic.get_location()' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    inactive_winbar = {
        lualine_a = { { 'filename', separator = { left = ' ', right=' ' }, right_padding = 10 } },
        lualine_b = { 'Navic.get_location()' },
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
--
-- local colors = {
--   blue   = '#80a0ff',
--   cyan   = '#79dac8',
--   black  = '#080808',
--   white  = '#c6c6c6',
--   red    = '#ff5189',
--   violet = '#d183e8',
--   grey   = '#303030',
-- }
--
-- local bubbles_theme = {
--   normal = {
--     a = { fg = colors.black, bg = colors.violet },
--     b = { fg = colors.white, bg = colors.grey },
--     c = { fg = colors.white },
--   },
--
--   insert = { a = { fg = colors.black, bg = colors.blue } },
--   visual = { a = { fg = colors.black, bg = colors.cyan } },
--   replace = { a = { fg = colors.black, bg = colors.red } },
--
--   inactive = {
--     a = { fg = colors.white, bg = colors.black },
--     b = { fg = colors.white, bg = colors.black },
--     c = { fg = colors.white },
--   },
-- }
--
-- require('lualine').setup {
--     options = {
--         theme = bubbles_theme,
--         component_separators = '',
--         section_separators = { left = '', right = '' },
--     },
--     sections = {
--         lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
--         lualine_b = { 'filename', 'branch' },
--         lualine_c = {
--             '%=', --[[ add your center compoentnts here in place of this comment ]]
--         },
--         lualine_x = {},
--         lualine_y = { 'filetype', 'progress' },
--         lualine_z = {
--             { 'location', separator = { right = '' }, left_padding = 2 },
--         },
--     },
--     inactive_sections = {
--         lualine_a = { 'filename' },
--         lualine_b = {},
--         lualine_c = {},
--         lualine_x = {},
--         lualine_y = {},
--         lualine_z = { 'location' },
--     },
--     tabline = {},
--     extensions = {},
-- }
