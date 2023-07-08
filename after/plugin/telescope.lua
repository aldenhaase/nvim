local builtin = require('telescope.builtin')
local extensions = require('telescope').extensions
vim.keymap.set('n', '<leader>fj', builtin.find_files, {})
vim.keymap.set('n', '<leader>fk', function() builtin.find_files({hidden=true, no_ignore=true}) end, {})
vim.keymap.set('n', '<leader>fl', function() builtin.find_files({cwd='~/'}) end, {})
vim.keymap.set('n', '<leader>gs', builtin.grep_string, {})
vim.keymap.set('n', '<leader>gg', function()
    extensions.live_grep_args.live_grep_args({search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

