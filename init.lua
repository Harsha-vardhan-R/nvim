require("hava")

vim.cmd [[ set nocompatible ]]
vim.cmd [[ 
    set spell
    set spelllang=en_us
]]

vim.api.nvim_set_keymap('n', '<ScrollWheelUp>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<ScrollWheelDown>', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<ScrollWheelUp>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<ScrollWheelDown>', '<Down>', { noremap = true, silent = true })

-- set the cursor colours all.
vim.cmd [[ set termguicolors ]]

require("tokyonight").setup({
    style = "day",
    on_colors = function(colors)
        colors.hint = "#ff8830"
        colors.error = "#ff2c2c"
    end
})

vim.cmd [[ set bg=light ]]
vim.cmd [[ colorscheme tokyonight ]]

-- vim.cmd [[
--     hi Normal guibg=#ffffff 
--     hi NormalNC guibg=#ffffff 
--     hi NormalFloat guibg=#ffffff
-- ]]

vim.cmd [[ hi! link WinSeparator LineNr ]]

-- vim.cmd [[ hi Comment guifg=#777777 gui=italic]]
-- vim.cmd [[ 
--     hi Cursor guifg=black guibg=darkgrey
--     hi Cursor2 guifg=white guibg=white
-- ]]
-- vim.cmd [[ set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50 ]]

print(string.format("Hello Harsha!"))
