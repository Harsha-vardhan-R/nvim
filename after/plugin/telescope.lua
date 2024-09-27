local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
    defaults = {
        mappings = {
            i = {
                ["<C-b>"] = actions.select_default,  -- Default action for Enter key
            },
        },
    },
    pickers = {
        colorscheme = {
            enable_preview = true
        }
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {

            }
        },
        ["media_files"] = {

        }
    }
}

require("telescope").load_extension("ui-select");

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.git_files, {})

vim.keymap.set('n', '<leader>gs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>a', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>ff', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>fa', builtin.live_grep, {})

vim.keymap.set('n', '<leader>zz', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>tm', builtin.man_pages, {})

vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {}) -- go to definition.
vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, {}) -- go to lsp implementation.
vim.keymap.set('n', '<leader>wsa', builtin.lsp_workspace_symbols ,{}) -- all workspace symbols.
vim.keymap.set('n', '<leader>wsp', builtin.lsp_document_symbols ,{}) -- present document workspace symbols.
vim.keymap.set('n', '<leader>lda', builtin.diagnostics, {})

vim.keymap.set('n', '<leader>lcr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>lci', builtin.lsp_incoming_calls, {})
vim.keymap.set('n', '<leader>lco', builtin.lsp_outgoing_calls, {})

vim.keymap.set('n', '<leader>lm', ":Telescope media_files<CR>" , {})

vim.keymap.set('n', '<leader>tp', ":lua require'telescope'.extensions.projects.projects{}<CR>" , {})

vim.keymap.set('n', '<leader>jj', builtin.jumplist, {})

