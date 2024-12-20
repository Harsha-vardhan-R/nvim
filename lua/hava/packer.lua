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
            "nvim-lua/plenary.nvim",
            'nvim-lua/popup.nvim',
            "nvim-telescope/telescope-ui-select.nvim",
            'nvim-telescope/telescope-media-files.nvim'
        }
    }

    -- themes
    use "Shatur/neovim-ayu"
    use "catppuccin/nvim"
    use "folke/tokyonight.nvim"
    use "rebelot/kanagawa.nvim"
    use "sainnhe/everforest"
    use "Mofiqul/vscode.nvim"
    use "scottmckendry/cyberdream.nvim"
    use "nyoom-engineering/oxocarbon.nvim"
    use "ribru17/bamboo.nvim"
    use "sainnhe/edge"
    use "mhartington/oceanic-next"
    use "HoNamDuong/hybrid.nvim"
    use "zootedb0t/citruszest.nvim"
    use "NTBBloodbath/doom-one.nvim"
    use "kaiuri/nvim-juliana"
    use "yorik1984/newpaper.nvim"
    use "Verf/deepwhite.nvim"
    use "ChristianChiarulli/nvcode-color-schemes.vim"
    use "FrenzyExists/aquarium-vim"

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
            , opt = true
        }
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

    -- indent lines.
    use { "lukas-reineke/indent-blankline.nvim" }

    -- Highlight the word and it's occurrences under cursor.
    use { "RRethy/vim-illuminate" }

    -- IDE like bread crumbs. 
    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    }

    -- Function signature.
    use { "ray-x/lsp_signature.nvim" }

    -- Highlight certain words and patterns.
    use "echasnovski/mini.hipatterns"

    use "tpope/vim-dispatch"

    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
    }

    use {
        'goolord/alpha-nvim',
        requires = 'nvim-tree/nvim-web-devicons'
    }

    use {
        "jake-stewart/force-cul.nvim",
        config = function()
            require("force-cul").setup()
        end
    }

end
)
