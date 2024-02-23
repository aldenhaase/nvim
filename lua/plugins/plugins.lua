-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-live-grep-args.nvim'},
        },
    },
    
    {
        'rose-pine/neovim',
        lazy = false,
        priority = 1000,
        name = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end,
    },
    
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end,
    },
    
    
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {"nvim-treesitter/playground"},
    {"nvim-lua/plenary.nvim"},
    
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { {"nvim-lua/plenary.nvim"} }
    },
    {"theprimeagen/refactoring.nvim"},
    {"mbbill/undotree"},
    {"tpope/vim-fugitive"},
    {"nvim-treesitter/nvim-treesitter-context"},
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        lazy = false,
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
    
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
    
            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    },
    
    {"folke/zen-mode.nvim"},
    {"eandrju/cellular-automaton.nvim"},
    {"laytan/cloak.nvim"},
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },
    {"rhysd/vim-clang-format"},
     --install without yarn or npm
    {
          "iamcco/markdown-preview.nvim",
          build = function() vim.fn["mkdp#util#install"]() end,
    },    
}
     -- use({ "iamcco/markdown-preview.nvim",
     --     run = "cd app && npm install",
     --     setup = function()
     --         vim.g.mkdp_filetypes = { "markdown" } end,
     --         ft = { "markdown" }, })
