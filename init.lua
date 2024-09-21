require("hava")

vim.api.nvim_set_keymap('n', '<ScrollWheelUp>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<ScrollWheelDown>', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<ScrollWheelUp>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<ScrollWheelDown>', '<Down>', { noremap = true, silent = true })

-- set the cursor colours.
vim.cmd [[ set termguicolors ]]

vim.cmd [[ set bg=dark ]]
vim.cmd [[ colorscheme tokyonight ]]

-- vim.cmd [[
--     hi Normal guibg=#ffffff 
--     hi NormalNC guibg=#ffffff 
--     hi NormalFloat guibg=#ffffff
-- ]]

vim.cmd [[ hi! link WinSeparator LineNr ]]

vim.cmd [[ hi Comment guifg=#777777 gui=italic]]
vim.cmd [[ 
    hi Cursor guifg=black guibg=darkgrey
    hi Cursor2 guifg=white guibg=white
]]
vim.cmd [[ set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50 ]]

print(string.format("Hello Harsha!"))




vim.opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function(data)
        -- buffer is a directory
        local isdirectory = vim.fn.isdirectory(data.file) == 1
        if not isdirectory then
            return
        end

        -- save session before exit
        vim.g.save_session = false

        -- check if directory is a project directory
        for _, root in ipairs({ ".git", ".hg", ".bzr", ".svn" }) do
            if vim.fn.isdirectory(data.file .. "/" .. root) == 1 then
                vim.g.save_session = true
                break
            end
        end

        if vim.g.save_session then
            -- source session.vim if it exists
            local sessionfile = vim.fn.resolve(data.file .. "/.nvim/session.vim")
            if vim.fn.filereadable(sessionfile) == 1 then
                vim.cmd("source " .. sessionfile)
            end
        end

        -- wipe the directory buffer
        vim.cmd("bw " .. data.buf)
    end,
    nested = true,
})

-- Check if we are in the project root.
-- If we are, save the session file.
vim.api.nvim_create_autocmd("VimLeave", {
    callback = function(data)
        -- only save session if vim started on a directory
        if not vim.g.save_session then
            return
        end

        local sessionfile = ".nvim/session.vim"
        if vim.v.this_session ~= "" then
            sessionfile = vim.v.this_session
        end

        vim.fn.mkdir(".nvim", "p")
        vim.cmd("mksession! " .. sessionfile)
    end,
})
