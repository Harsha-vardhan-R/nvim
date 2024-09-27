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

            requires = {
                'nvim-tree/nvim-web-devicons',
            },
            config = function()
                local alpha = require 'alpha'
                local dashboard = require 'alpha.themes.dashboard'

                _Gopts = {
                    position = 'center',
                    hl = 'Type',
                    wrap = 'overflow',
                }

                -- DASHBOARD HEADER

                local function getGreeting(name)
                    local tableTime = os.date '*t'
                    local datetime = os.date ' %Y-%m-%d-%A   %H:%M:%S '
                    local hour = tableTime.hour
                    local greetingsTable = {
                        [1] = '  Sleep well',
                        [2] = '  Good morning',
                        [3] = '  Good afternoon',
                        [4] = '  Good evening',
                        [5] = '󰖔  Good night',
                    }
                    local greetingIndex = 0
                    if hour == 23 or hour < 7 then
                        greetingIndex = 1
                    elseif hour < 12 then
                        greetingIndex = 2
                    elseif hour >= 12 and hour < 18 then
                        greetingIndex = 3
                    elseif hour >= 18 and hour < 21 then
                        greetingIndex = 4
                    elseif hour >= 21 then
                        greetingIndex = 5
                    end
                    return datetime .. '  ' .. greetingsTable[greetingIndex] .. ', ' .. name
                end

                local logo = [[

                ⣗⣡⣾⠈⣹⣿⣿⣿⣿⣿⣯⡉⠛⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠈⠙⣿⣿⣿⠟⠉⠈⢻⣿⡾⣿⣗⣽⣿⡚⢀⡀⣿⣅⡀⠁⠀⠀⠀⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣄
                ⠛⠛⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠉⠙⠻⢿⣿⣿⠀⠀⠀⠀⠀⠈⠿⠃⠀⠀⠀⠀⢿⣿⣿⣿⡿⢻⣿⠘⣶⠀⠉⠁⠀⠀⠀⠀⠀⠀⠐⠂⠐⠒⠒⠀⠀⠈⠉⡟⣟⠛
                ⣀⣀⣚⣒⣋⣹⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠉⢁⣀⣤⡶⠶⠶⠶⠶⠶⠶⢦⣄⣀⠘⣿⡿⠋⠀⢸⣿⣬⣭⣀⣀⣐⣛⣂⠀⢄⣤⣤⣄⣠⣠⣦⣠⣖⣒⣖⣰⣻⣿⣟
                ⠀⠀⠀⠈⠀⠈⠉⠀⠉⠉⠙⢛⣿⣿⣧⠀⠀⠀⠀⠀⣠⣾⠟⠉⠀⠀⠀⠀⠀⠀⠀⡀⠀⠈⠙⠳⣮⣀⡀⠀⢸⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀
                ⢶⢶⡦⣤⡤⢒⣲⣶⣶⣶⣾⣿⣿⣿⣿⡆⠀⠀⢀⣾⠏⠀⠀⠀⠀⠀⣀⣀⣤⡴⠾⠃⢀⣠⣤⠶⢛⣫⣿⠀⣸⣿⣿⣿⣷⠒⠠⠀⠀⠠⠤⠄⠀⠤⠤⠔⠒⠒⠶⠶⢆⡀⠠⠶⠖
                ⠈⡾⠁⣿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠃⠀⢀⣾⠁⠀⠀⠀⠀⠘⠛⠉⣉⣥⣤⠶⠞⢋⣩⣴⡾⠟⠋⢻⣦⣿⠿⠋⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⠀⠀
                ⢠⠉⠃⠲⣿⣿⣿⣟⠉⠉⠉⠉⠀⠀⠀⠀⠀⣼⡇⢠⣾⠟⠛⠛⢛⣉⣉⣉⣥⣶⠶⠿⠋⠉⠀⠀⠀⠀⣠⣿⡅⠀⠀⢸⡿⠠⡆⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀
                ⢨⣤⣷⣾⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⣿⠀⠈⠙⠛⠋⠉⠉⠉⠉⠀⣠⡀⠀⠀⠀⠀⣤⡄⠀⠀⠈⠙⠻⣶⣀⣿⣟⣂⣀⣿⡘⢋⣀⣀⡒⢃⣿⡀⠀⠀⣒⣒⣒⣒⣂⣀⡀
                ⠀⠀⠀⠀⠀⠈⠉⢿⣿⣿⣷⣄⠀⠀⠀⠀⠀⣇⠀⠀⠀⠀⣠⡶⠁⠀⠀⠀⠙⠻⣦⡀⠀⢸⡏⠀⠀⠀⣀⣀⣀⣈⣿⡋⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                ⡒⠒⡂⢶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⣿⠀⠀⠀⢠⡿⠀⢀⣀⣤⣤⠤⠤⠼⣷⠀⣾⣦⠶⣿⠛⠛⠋⠉⠉⢹⣷⠶⠖⡒⠖⠖⠒⠒⠲⠖⠒⠒⠒⠒⠀⠒⠒⠂⠂⠀⠐⠂
                ⡅⠀⠁⠿⢏⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⣿⠀⠀⠀⢸⡷⠞⠛⠿⠃⠀⠀⠀⠀⢸⡇⢹⣇⠀⠀⠀⠀⠀⠀⠀⣼⡏⠲⡌⠁⠐⠀⢀⡀⣤⠀⠰⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                ⠄⠈⠃⢿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⢿⡇⠀⠀⠈⢷⣄⠀⠀⠀⠀⠀⠀⢠⣾⠀⠈⢿⣷⣄⣀⣀⣀⣴⠾⢻⣿⡈⡆⠀⢀⣣⣼⣷⣶⣶⣾⣦⡦⢀⠀⠀⠀⢀⠀⡀⠀⠀
                ⢀⣀⣀⣰⣿⣿⡿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⢸⣧⠀⠀⠀⠈⠛⢶⣤⣀⣀⣠⡶⠟⠁⠀⠀⠀⢿⡄⠈⠉⢉⣠⣴⠟⣿⣩⣵⣾⣿⡛⠍⢿⣷⠛⣿⡝⢿⣦⣌⠀⢀⠀⠀⣀⠀⠀
                ⠀⠀⠀⠘⠿⣧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⡀⠀⠀⠀⠀⣄⠀⠀⠀⠀⢀⣠⡤⢺⣄⠀⢸⡇⠀⠛⠋⢁⣠⣴⣿⣿⠿⠛⠁⠀⠀⢘⣿⡀⠘⣿⡄⠻⣇⠀⠀⠀⠀⠀⠀⠀
                ⠒⢒⡲⣶⣶⣿⣿⣷⣦⣤⡀⠀⠀⠀⠀⠀⠀⠀⢸⣇⣠⡤⠀⠀⠙⠓⠒⠒⠚⠛⠉⠀⠀⠻⣷⣾⠃⣠⣴⣾⣿⠿⠛⠉⠀⠀⢀⣤⠶⠚⠉⢻⣷⠀⠈⣿⡄⠹⣷⣶⡒⠒⠂⠐⠒
                ⠀⠀⠈⣻⣿⣿⣿⣿⣿⣿⣿⣷⣦⣤⣀⡀⠀⠀⠀⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢹⣿⡿⠟⠉⠁⠀⢀⣠⡴⠚⠉⠁⠀⠀⠀⠀⢿⣷⡀⠘⣿⡀⢹⣿⠁⠀⠈⠁⠀
                ⠀⠀⠀⠺⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⢿⣦⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⢸⣧⠀⠀⣠⡴⠞⠋⠁⣴⣤⣀⡀⠀⠀⠀⠀⠀⢻⣷⣀⣸⡇⠈⣿⡇⢨⢠⠀⠀
                ⢠⡀⠀⣀⠀⢨⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⢻⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠟⣛⣣⣿⣶⠟⠁⠀⠀⠀⠀⢿⣎⠙⠻⣶⣄⠀⢀⣴⡾⠟⠛⠛⠁⠀⣿⣧⣀⠀⠀⠤
                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣩⣿⣿⠛⠀⠀⠀⠀⠀⠘⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⣿⡁⣈⣿⡄⠀⠀⠀⠀⠀⠀⠙⢷⣤⡀⠙⠷⠿⠋⠀⠀⠀⠀⠀⠀⢿⣄⣀⡀⠀⠀
                ⠀⠁⠀⠁⠀⠈⠙⠛⢿⣿⣿⣿⠟⠁⠀⠀⣀⣤⣶⠆⠀⠘⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠈⢣⡹⣿⣷⣿⣿⡄⠀⠀⠀⠀⠀⠀⢀⣽⣿⣷⣶⣠⠀⣄⠀⠀⠀⠀⠀⣨⣿⢿⣿⣿⣾
                ⠘⣀⠀⠈⠁⠀⠈⠉⡭⠻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⢠⡄⠈⢿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠈⠷⣦⣴⠇⠘⢿⣆⣀⣀⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣶⣿⠟⠁⠀⢻⣿⣿
                ⠀⠉⠀⠀⠀⠀⠶⠀⠐⠖⠚⢻⣿⣿⣿⣿⣿⣿⠇⣴⣿⣷⠀⢀⣽⣿⣕⢦⣄⡀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⡀⠀⠀⠀⠀⠹⣿
                ⠤⠤⠤⠤⠤⠤⠤⠧⠤⠄⠤⠼⠿⠽⣿⣿⣿⣿⣿⣿⣿⣿⣤⣾⣿⣿⣿⣿⣶⣬⣿⣛⣟⣿⣯⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⠿⠿⠿⠿⠿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠹
                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣘⣛⣉⣉⣿⣿⣿⣿⣿⡯⠉⠉⠉⠉⠉⢸⣿⣤⣄⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⢀⣙⣿⣿⣿⣄⠀⠀⠀⠀
                ⠀⠀⠉⠉⠉⠉⠉⠀⠉⠉⢉⣉⢉⣩⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣷⣀⡀⠀⢀⣠⣼⡏⠉⠛⠛⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣭⣿⣯⣭⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀
                ⠀⠀⠀⠀⠠⢀⠀⠀⠀⢀⢠⣤⣨⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠉⠁⠀⢀⡾⠘⣯⠉⠉⠉⠉⠁⠈⣷⠸⣧⠀⠀⠀⠀⠀⠉⠉⠙⠻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀
                ⠀⠀⠀⠀⢠⠀⠀⠀⠀⢀⠀⢰⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⣾⠃⠀⣿⠀⠀⠀⠀⠀⠀⢿⠀⠘⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠛⠻⠿⢿⣿⣿⣿⣿⣿⣿⣆
                ⠤⠤⠤⠤⠤⠤⠠⠤⠽⠧⠴⠿⠿⠿⣿⣿⣿⡏⠀⠀⠀⠀⡀⠀⠀⣾⠇⠀⠀⣿⠀⠀⠀⠀⠀⠀⢸⡆⠀⠈⢷⡀⠀⠀⣦⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠻⠿⣿
                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣠⣼⣿⠀⠀⠀⠀⣸⡇⠀⣼⠏⠀⠀⢠⣿⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠈⠻⣆⠀⣿⣿⣿⣿⣿⣶⣶⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈
                ⠁⠀⠈⠉⠁⠀⠙⠛⢋⣽⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⢀⣿⠁⣰⡟⠀⠀⠀⠘⣿⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠙⢧⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣦⣤⣄⣀⠀⠀⠀
                ⣶⡀⠀⠀⠘⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⢸⡏⢠⡿⠀⠀⠀⠀⢠⣿⠀⠀⠀⠀⠀⠀⠘⣧⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶
                ⣿⠀⠀⠀⠀⠠⠀⣀⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⢠⣿⠀⣾⠁⠀⠀⠀⠀⢸⡿⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⠀⢠⣿⣿⡏⢻⡿⠿⠿⢿⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
                ⠿⠷⠾⠶⠴⠿⠶⠿⠿⠿⢿⣿⣿⣿⡟⠀⠀⠀⠀⣼⡏⠀⢻⣷⡀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⢠⣿⠀⢿⠭⠭⠥⠤⡤⠶⠶⠦⠬⠽⠿⠿⠿⠿⠿⠿⠿⠿⠿

                ]]

                local userName = 'Lazy'
                local greeting = getGreeting(userName)
                local marginBottom = 0
                dashboard.section.header.val = vim.split(logo, '\n')

                -- Split logo into lines
                local logoLines = {}
                for line in logo:gmatch '[^\r\n]+' do
                    table.insert(logoLines, line)
                end

                -- Calculate padding for centering the greeting
                local logoWidth = logo:find '\n' - 1 -- Assuming the logo width is the width of the first line
                local greetingWidth = #greeting
                local padding = math.floor((logoWidth - greetingWidth) / 2)

                -- Generate spaces for padding
                local paddedGreeting = string.rep(' ', padding) .. greeting

                -- Add margin lines below the padded greeting
                local margin = string.rep('\n', marginBottom)

                -- Concatenate logo, padded greeting, and margin
                local adjustedLogo = logo .. '\n' .. paddedGreeting .. margin

                dashboard.section.buttons.val = {
                    dashboard.button('p', '  Projects', ":lua require'telescope'.extensions.projects.projects{}<CR>"),
                    dashboard.button('n', '  New file', ':ene <BAR> startinsert <CR>'),
                    dashboard.button('f', '  Find file', ':cd $HOME | silent Telescope find_files hidden=true no_ignore=true <CR>'),
                    dashboard.button('t', '  Find text', ':Telescope live_grep <CR>'),
                    dashboard.button('r', '󰄉  Recent files', ':Telescope oldfiles <CR>'),
                    dashboard.button('c', '  Settings', ':e $HOME/.config/nvim/init.lua<CR>'),
                    dashboard.button('q', '󰿅  Quit', '<cmd>qa<CR>'),
                },

                -- local function footer()
                    -- 	return "Footer Text"
                    -- end

                    -- dashboard.section.footer.val = vim.split('\n\n' .. getGreeting 'Lazy', '\n')

                    vim.api.nvim_create_autocmd('User', {
                        pattern = 'LazyVimStarted',
                        desc = 'Add Alpha dashboard footer',
                        once = true,
                        callback = function()
                            local stats = require('lazy').stats()
                            local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
                            dashboard.section.footer.val = { ' ', ' ', ' ', ' Loaded ' .. stats.count .. ' plugins  in ' .. ms .. ' ms ' }
                            dashboard.section.header.opts.hl = 'DashboardFooter'
                            pcall(vim.cmd.AlphaRedraw)
                        end,
                    })

                    dashboard.opts.opts.noautocmd = true
                    alpha.setup(dashboard.opts)
                end,
            }
        end)
