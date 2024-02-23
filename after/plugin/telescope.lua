local builtin = require('telescope.builtin')
local lga = require('telescope').extensions.live_grep_args
vim.keymap.set('n', '<leader>fj', builtin.find_files, {})
vim.keymap.set('n', '<leader>fk', function() builtin.find_files({hidden=true, no_ignore=true}) end, {})
vim.keymap.set('n', '<leader>fl', function() builtin.find_files({cwd='~/'}) end, {})
vim.keymap.set('n', '<leader>gs', builtin.grep_string, {})
vim.keymap.set('n', '<leader>gg', function()
    lga.live_grep_args({})
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

