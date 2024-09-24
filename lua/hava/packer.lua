vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Scrollbar for nvim.
    use {
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup()
        end
    }

    -- Icons
    -- Tab setting and it's Icons.
    use { 'nvim-tree/nvim-web-devicons' }

    -- GitSigns in the Status bar.
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup()
            require("scrollbar.handlers.gitsigns").setup()
        end
    }

    -- open files with previews, search them or through them.
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = {
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-lua/plenary.nvim"
        }
    }

    -- themes
    use "folke/tokyonight.nvim"

    -- code parsing and formatting.
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Undo Like every modification is a git commit.
    use {
        'mbbill/undotree'
    }

    -- Git
    use { 'tpope/vim-fugitive' }

    -- The Whole LSP Thing.
    use {
        'VonHeikemen/lsp-zero.nvim',

        requires = {
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'saadparwaiz1/cmp_luasnip'},

            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons'
        , opt = true }
    }

    -- file-explorer
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
            {
                's1n7ax/nvim-window-picker',
                version = '2.*',
                config = function()
                    require 'window-picker'.setup({
                        filter_rules = {
                            include_current_win = false,
                            autoselect_one = true,
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { 'terminal', "quickfix" },
                            },
                        },
                    })
                end,
            },
        },
        config = function ()
            -- If you want icons for diagnostic errors, you'll need to define them somewhere:
            vim.fn.sign_define("DiagnosticSignError",
            {text = " ", texthl = "DiagnosticSignError"})
            vim.fn.sign_define("DiagnosticSignWarn",
            {text = " ", texthl = "DiagnosticSignWarn"})
            vim.fn.sign_define("DiagnosticSignInfo",
            {text = " ", texthl = "DiagnosticSignInfo"})
            vim.fn.sign_define("DiagnosticSignHint",
            {text = "󰌵", texthl = "DiagnosticSignHint"})
        end
    }

    use { 'folke/trouble.nvim' }

    -- Fancy floating terminal.
    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
            require("toggleterm").setup()
        end
    }

    use {
        "matbme/JABS.nvim",
        config = function()
            require("jabs").setup()
        end
    }

    -- Smart auto pairs.
    use {
        'altermo/ultimate-autopair.nvim',
        event={'InsertEnter','CmdlineEnter'},
        branch='v0.6', --recommended as each new version will have breaking changes
        config=function ()
            require('ultimate-autopair').setup()
        end
    }

    use { "preservim/tagbar" }

    use { "pocco81/auto-save.nvim" }

    -- Debug Adapter Protocol for nvim.
    use { "mfussenegger/nvim-dap" }
    use { "theHamsta/nvim-dap-virtual-text" }
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

    -- edit surrunding stuff, like adding paranthesis or adding quotes.
    use { "tpope/vim-surround" }

    -- smooth scroll animations.
    use {
        'karb94/neoscroll.nvim'
    }

    -- indent lines.
    use { "lukas-reineke/indent-blankline.nvim" }

    -- Highlight the word and it's occurences under cursor.
    use { "RRethy/vim-illuminate" }

    -- IDE like path to workspace symbol at the top.
    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    }

    -- Function signature.
    use { "ray-x/lsp_signature.nvim" }

    -- Highlight certain words and patterns.
    use "echasnovski/mini.hipatterns"
    
    -- Session manager.
    use {
        "Shatur/neovim-session-manager",
        requires = {
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-lua/plenary.nvim"
        }
    }

    use {
        "eoh-bse/minintro.nvim",
        config = function () require("minintro").setup()
        end
    }

end)
