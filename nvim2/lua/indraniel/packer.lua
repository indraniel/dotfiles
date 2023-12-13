-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} )
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    })

    use('voldikss/vim-floaterm')
    use('preservim/tagbar')
    use('tpope/vim-surround')
    use('HiPhish/nvim-ts-rainbow2') -- rainbow parens

    use('guns/vim-sexp')
    use('tpope/vim-sexp-mappings-for-regular-people')

    use({'julienvincent/nvim-paredit', ft = {'lisp', 'clojure', 'scheme'} })
    use({'gpanders/nvim-parinfer', ft = {'lisp', 'clojure', 'scheme'} })
    use({
        'dundalek/parpar.nvim',
        ft = {'lisp', 'clojure', 'scheme'},
        dependences = {
            "julienvincent/nvim-paredit",
            "gpanders/nvim-parinfer",
        },
        requires = {
            "julienvincent/nvim-paredit",
            "gpanders/nvim-parinfer",
        },
        config = function()
            local paredit = require("nvim-paredit")
            require("parpar").setup {
              paredit = {
                -- pass any nvim-paredit options here
                keys = {
                  -- custom bindings are automatically wrapped
                  ["<A-H>"] = { paredit.api.slurp_backwards, "Slurp backwards" },
                  ["<A-J>"] = { paredit.api.barf_backwards, "Barf backwards" },
                  ["<A-K>"] = { paredit.api.barf_forwards, "Barf forwards" },
                  ["<A-L>"] = { paredit.api.slurp_forwards, "Slurp forwards" },
                }
              }
            }
        end
    })

    use({ 'kovisoft/slimv', ft = {'lisp'} })

    use({'Olical/conjure', ft = {'clojure', 'scheme', 'rust'} })
    use({'Olical/aniseed'})

    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    })

    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    })

    use({
        "scalameta/nvim-metals",
        ft = {'scala'},
        requires = {
          "nvim-lua/plenary.nvim",
          "mfussenegger/nvim-dap",
        },
    })

end)
