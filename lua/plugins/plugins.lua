-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return {

    -- ─── Fuzzy Finder ────────────────────────────────────────────────────────
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-live-grep-args.nvim'},
            -- Native FZF sorter: much faster matching
            {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
        },
    },

    -- ─── Colorscheme ─────────────────────────────────────────────────────────
    {
        'scottmckendry/cyberdream.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup({
                transparent = true,
                italic_comments = false,
                hide_fillchars = false,
                borderless_telescope = true,
                terminal_colors = true,
                cache = false,
                theme = {
                    variant = "dark",
                    saturation = 1,
                },
                extensions = {
                    telescope = true,
                },
            })
            vim.cmd('colorscheme cyberdream')
        end,
    },

    -- ─── Diagnostics (trouble v3) ─────────────────────────────────────────────
    -- v3 replaced the old config/setup pattern with opts = {}
    {
        "folke/trouble.nvim",
        opts = {},
    },

    -- ─── Treesitter ───────────────────────────────────────────────────────────
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {"nvim-treesitter/nvim-treesitter-context"},

    -- ─── Navigation ───────────────────────────────────────────────────────────
    {"nvim-lua/plenary.nvim"},
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {{"nvim-lua/plenary.nvim"}},
    },

    -- ─── Utilities ────────────────────────────────────────────────────────────
    {"theprimeagen/refactoring.nvim"},
    {"mbbill/undotree"},
    {"tpope/vim-fugitive"},
    {"folke/zen-mode.nvim"},
    {"eandrju/cellular-automaton.nvim"},
    {"laytan/cloak.nvim"},

    -- ─── LSP ──────────────────────────────────────────────────────────────────
    -- lsp-zero is no longer needed. Neovim 0.10+ ships with a mature LSP client.
    -- nvim-lspconfig provides per-server defaults; Mason handles installation.
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {'williamboman/mason.nvim', opts = {}},
            {'williamboman/mason-lspconfig.nvim'},
        },
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            -- mason-lspconfig bridges Mason installs → lspconfig
            require('mason-lspconfig').setup({
                -- Add any servers you want auto-installed here
                ensure_installed = { 'pyright', 'lua_ls', 'clangd' },
                handlers = {
                    function(server_name)
                        lspconfig[server_name].setup({ capabilities = capabilities })
                    end,
                },
            })
        end,
    },

    -- ─── Completion ───────────────────────────────────────────────────────────
    -- blink.cmp replaces nvim-cmp + 6 companion plugins.
    -- It is written in Rust, significantly faster, and has become the
    -- community standard. Snippets and LSP sources are built-in.
    {
        'saghen/blink.cmp',
        version = '*',
        opts = {
            keymap = { preset = 'default' },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            -- Enables blink to expose capabilities to nvim-lspconfig
            signature = { enabled = true },
        },
    },

    -- ─── UI ───────────────────────────────────────────────────────────────────
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
    },

    -- ─── Language-specific ────────────────────────────────────────────────────
    {"rhysd/vim-clang-format"},
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {},
        ft = { "markdown" },
    },
}
