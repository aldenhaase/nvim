-- after/plugin/lsp.lua
-- Rewritten without lsp-zero and nvim-cmp.
-- Server installation (clangd, lua_ls, etc.) is handled in plugins.lua
-- via mason-lspconfig. blink.cmp handles all completion.

-- ─── Diagnostic signs (replaces lsp.set_preferences sign_icons) ──────────────
vim.diagnostic.config({
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = 'E',
            [vim.diagnostic.severity.WARN]  = 'W',
            [vim.diagnostic.severity.HINT]  = 'H',
            [vim.diagnostic.severity.INFO]  = 'I',
        },
    },
})

-- ─── Keymaps — attached per-buffer when an LSP connects ──────────────────────
-- Replaces lsp.on_attach(function(client, bufnr) ... end)
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP keymaps',
    callback = function(event)
        local opts = { buffer = event.buf, remap = false }

        vim.keymap.set("n", "gd",           vim.lsp.buf.definition,        opts)
        vim.keymap.set("n", "K",            vim.lsp.buf.hover,             opts)
        vim.keymap.set("n", "<leader>vws",  vim.lsp.buf.workspace_symbol,  opts)
        vim.keymap.set("n", "<leader>vca",  vim.lsp.buf.code_action,       opts)
        vim.keymap.set("n", "<leader>vrr",  vim.lsp.buf.references,        opts)
        vim.keymap.set("n", "<leader>vrn",  vim.lsp.buf.rename,            opts)
        vim.keymap.set("i", "<C-h>",        vim.lsp.buf.signature_help,    opts)
    end,
})
