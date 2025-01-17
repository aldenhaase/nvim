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
        'davidhalter/jedi-vim',
    },
    {
        'scottmckendry/cyberdream.nvim',
        lazy = false,
        priority = 1000,
        config = function()

require("cyberdream").setup({
    -- Enable transparent background
    transparent = true,

    -- Enable italics comments
    italic_comments = false,

    -- Replace all fillchars with ' ' for the ultimate clean look
    hide_fillchars = false,

    -- Modern borderless telescope theme - also applies to fzf-lua
    borderless_telescope = true,

    -- Set terminal colors used in `:terminal`
    terminal_colors = true,

    -- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
    cache = false,

    theme = {
        variant = "dark", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
        saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)
        -- highlights = {
        --     -- Highlight groups to override, adding new groups is also possible
        --     -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

        --     -- Example:
        --     Comment = { fg = "#696969", bg = "NONE", italic = true },

        --     -- Complete list can be found in `lua/cyberdream/theme.lua`
        -- },

        -- Override a highlight group entirely using the color palette
        -- overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
        --     -- Example:
        --     return {
        --         Comment = { fg = colors.green, bg = "NONE", italic = true },
        --         ["@property"] = { fg = colors.magenta, bold = true },
        --     }
        -- end,

        -- Override a color entirely
        -- colors = {
        --     -- For a list of colors see `lua/cyberdream/colours.lua`
        --     -- Example:
        --     bg = "#000000",
        --     green = "#00ff00",
        --     magenta = "#ff00ff",
        -- },
    },

    -- Disable or enable colorscheme extensions
    extensions = {
        telescope = true,
    },
})
            vim.cmd('colorscheme cyberdream')
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
