require("hava")

vim.cmd [[ set nocompatible ]]

vim.api.nvim_set_keymap('n', '<ScrollWheelUp>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<ScrollWheelDown>', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<ScrollWheelUp>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<ScrollWheelDown>', '<Down>', { noremap = true, silent = true })

-- set the cursor colors all.
vim.cmd [[ set termguicolors ]]
vim.cmd[[set guifont=Hack\ Nerd\ Font:h10.3]]

vim.cmd [[ set bg=dark ]]
vim.cmd [[ colorscheme catppuccin-mocha ]]
--
-- vim.cmd [[ hi! link WinSeparator LineNr ]]

-- vim.cmd [[ set statuscolumn=%@SignCb@%s%=%T%@NumCb@%r│\  ]]
-- vim.cmd [[ hi Comment guifg=#777777 gui=italic]]
--
-- vim.cmd [[ 
--     hi Cursor guifg=black guibg=darkgrey
--     hi Cursor2 guifg=white guibg=white
-- ]]
-- vim.cmd [[ set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50 ]]

print(string.format("Hello Harsha!"))
