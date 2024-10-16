local util = require 'lspconfig.util'

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
    callback = function(event)

        local opts = {buffer = event.buf}

        vim.keymap.set('n', 'm', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', '<leader>lca', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>lrn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('i', 'C-l', function() vim.lsp.buf.signature_help() end, opts)

    end,
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'rust_analyzer',
        "clangd",
        "lua_ls",
        "bashls",
        "pyright",
        "solidity_ls"
    },
    automatic_installation = true,
    handlers = {
        clangd = function()
            require('lspconfig').clangd.setup({
                capabilities = lsp_capabilities,
                cmd = { "clangd" },
                filetypes = { "c", "cpp", "objc", "objcpp" },
                root_dir = require('lspconfig').util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
            })
        end,
        function(server_name)
            require('lspconfig')[server_name].setup({
                capabilities = lsp_capabilities,
            })
        end,
        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                capabilities = lsp_capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT'
                        },
                        diagnostics = {
                            globals = {'vim'},
                        },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                            }
                        }
                    }
                }
            })
        end,
    }
})

local cmp = require('cmp')

require('luasnip.loaders.from_vscode').lazy_load()

local lspkind = {
    Text = "𝕋",
    Method = "❒",
    Function = "▭",
    Constructor = "",
    Field = "𝔽",
    Variable = "𝕍",
    Class = "",
    Interface = "",
    Module = "",
    Property = "P",
    Unit = "♦",
    Value = "⚛",
    Enum = "",
    Keyword = "𝕂",
    Snippet = "",
    Color = "Ꞇ",
    File = "🗎",
    Reference = "↪",
    Folder = "🗀",
    EnumMember = "",
    Constant = "C",
    Struct = "",
    Event = "",
    Operator = "∅",
    TypeParameter = "∎"
}

cmp.setup({
    -- Sources for the Auto-Fill.
    sources = {
        {name = 'path' , keyword_length = 2},
        {name = 'nvim_lsp' , keyword_length = 1},
        {name = 'luasnip', keyword_length = 2},
        {name = 'buffer', keyword_length = 3},
    },
    mapping = cmp.mapping.preset.insert({
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    preselect = cmp.PreselectMode.Item,  -- Automatically select the first item
    formatting = {
        fields = { "abbr", "menu", "kind" },
        format = function(entry, item)
            -- Define menu shorthand for different completion sources.
            local menu_icon = {
                nvim_lsp = "LSP",
                nvim_lua = "LUA",
                luasnip  = "SNP",
                buffer   = "BUF",
                path     = "PTH",
            }
            -- Set the menu "icon" to the shorthand for each completion source.
            item.menu = menu_icon[entry.source.name]

            local symb = lspkind[item.kind] or "~"
            item.kind = string.format("%s %s", symb, item.kind)

            -- Set the fixed width of the completion menu to 60 characters.
            local fixed_width = 50
            -- Set 'fixed_width' to false if not provided.
            fixed_width = fixed_width or false

            -- Get the completion entry text shown in the completion window.
            local content = item.abbr

            -- Set the fixed completion window width.
            if fixed_width then
                vim.o.pumwidth = fixed_width
            end

            -- Get the width of the current window.
            local win_width = vim.api.nvim_win_get_width(0)

            -- Set the max content width based on either: 'fixed_width'
            -- or a percentage of the window width, in this case 20%.
            -- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
            local max_content_width = math.max(math.floor(win_width * 0.5), 50)

            -- Truncate the completion entry text if it's longer than the
            -- max content width. We subtract 3 from the max content width
            -- to account for the "..." that will be appended to it.
            if #content > max_content_width then
                item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
            else
                item.abbr = content .. (" "):rep(max_content_width - #content)
            end
            return item
        end,
    },
})

local function switch_source_header(bufnr)
    bufnr = util.validate_bufnr(bufnr)
    local clangd_client = util.get_active_client_by_name(bufnr, 'clangd')
    local params = { uri = vim.uri_from_bufnr(bufnr) }
    if clangd_client then
        clangd_client.request('textDocument/switchSourceHeader', params, function(err, result)
            if err then
                error(tostring(err))
            end
            if not result then
                print 'Corresponding file cannot be determined'
                return
            end
            vim.api.nvim_command('edit ' .. vim.uri_to_fname(result))
        end, bufnr)
    else
        print 'method textDocument/switchSourceHeader is not supported by any servers active on the current buffer'
    end
end

local root_files = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac', -- AutoTools
}

local default_capabilities = {
    textDocument = {
        completion = {
            editsNearCursor = true,
        },
    },
    offsetEncoding = { 'utf-8', 'utf-16' },
}

require 'lspconfig'.clangd.setup{
    on_attach = function(client, bufnr)
        -- Enable diagnostics
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {
                prefix = '✵',
                spacing = 4,
            },
            signs = true,
            update_in_insert = true,
        }
        )
    end,
}

require 'lspconfig'.solidity_ls.setup{
    on_attach = function(client, bufnr)
        -- Enable diagnostics
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {
                prefix = '✵',
                spacing = 4,
            },
            signs = true,
            update_in_insert = true,
        }
        )
    end,
}

require 'lspconfig'.rust_analyzer.setup{
    on_attach = function(client, bufnr)
        -- Enable diagnostics
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {
                prefix = '✵',
                spacing = 4,
            },
            signs = true,
            update_in_insert = false,
        }
        )
    end,
}

return {
    default_config = {
        cmd = { 'clangd' },
        filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
        root_dir = function(fname)
            return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
        end,
        single_file_support = true,
        capabilities = default_capabilities,
    },
    commands = {
        ClangdSwitchSourceHeader = {
            function()
                switch_source_header(0)
            end,
            description = 'Switch between source/header',
        },
    },
    docs = {
        description = [[
        https://clangd.llvm.org/installation.html

        - **NOTE:** Clang >= 11 is recommended! See [#23](https://github.com/neovim/nvim-lsp/issues/23).
        - If `compile_commands.json` lives in a build directory, you should
        symlink it to the root of your source tree.
        ```
        ln -s /path/to/myproject/build/compile_commands.json /path/to/myproject/
        ```
        - clangd relies on a [JSON compilation database](https://clang.llvm.org/docs/JSONCompilationDatabase.html)
        specified as compile_commands.json, see https://clangd.llvm.org/installation#compile_commandsjson
        ]],
        default_config = {
            root_dir = [[
            root_pattern(
            '.clangd',
            '.clang-tidy',
            '.clang-format',
            'compile_commands.json',
            'compile_flags.txt',
            'configure.ac',
            '.git'
            )
            ]],
            capabilities = [[default capabilities, with offsetEncoding utf-8]],
        },
    },
}

