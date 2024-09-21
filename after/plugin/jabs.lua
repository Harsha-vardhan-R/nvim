
-- open all the available buffers using JABSOpen.
vim.api.nvim_set_keymap('n', '<Leader>a', ':JABSOpen<CR>', { silent = true} )

require 'jabs'.setup {
    -- Options for the main window
    position = {'center', 'center'}, -- position = {'<position_x>', '<position_y>'} | <position_x> left, center, right,
                                  --                                             <position_y> top, center, bottom
                                  -- Default {'right', 'bottom'}

    relative = 'win', -- win, editor, cursor. Default win
    clip_popup_size = true, -- clips the popup size to the win (or editor) size. Default true

    width = 80, -- default 50
    height = 20, -- default 10
    border = 'double', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default shadow

    offset = { -- window position offset
        top = 0, -- default 0
        bottom = 0, -- default 0
        left = 0, -- default 0
        right = 0, -- default 0
    },

    sort_mru = true, -- Sort buffers by most recently used (true or false). Default false
    split_filename = true, -- Split filename into separate components for name and path. Default false
    split_filename_path_width = 0, -- If split_filename is true, how wide the column for the path is supposed to be, Default 0 (don't show path)

    -- Options for preview window
    preview_position = 'bottom', -- top, bottom, left, right. Default top
    preview = {
        width = 80, -- default 70
        height = 60, -- default 30
        border = 'double', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default double
    },

    -- Default symbols
    symbols = {
        current = ".", -- default 
        split = "|", -- default 
        alternate = "~", -- default 
        hidden = "◇", -- default ﬘
        locked = "🔑", -- default 
        ro = "R", -- default 
        edited = "+", -- default 
        terminal = "", -- default 
        default_file = "", -- Filetype icon if not present in nvim-web-devicons. Default 
        terminal_symbol = "" -- Filetype icon for a terminal split. Default 
    },

    -- Keymaps
    keymap = {
        close = "<c-d>", -- Close buffer. Default D
        jump = "<cr>", -- Jump to buffer. Default <cr>
        h_split = "h", -- Horizontally split buffer. Default s
        v_split = "v", -- Vertically split buffer. Default v
        preview = "p", -- Open buffer preview. Default P
    },

    -- Whether to use nvim-web-devicons next to filenames
    use_devicons = false -- true or false. Default true
}
