require("setup.set")
require("setup.remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

local augroup = vim.api.nvim_create_augroup
local setupGroup = augroup('setup', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})


--autocmd({"BufWritePre"}, {
--    group = setupGroup,
--    pattern = "*",
--    command = [[%s/\s\+$//e]],
--})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.clipboard = {
  name = 'WslClipboard',
  copy = {
    ['+'] = 'clip.exe',
    ['*'] = 'clip.exe',
  },
  paste = {
    ['+'] = function()
      vim.fn.system('powershell.exe -c "[console]::stdout.WriteLine(Get-Clipboard -Raw)"')
    end,
    ['*'] = function()
      vim.fn.system('powershell.exe -c "[console]::stdout.WriteLine(Get-Clipboard -Raw)"')
    end,
  },
  cache_enabled = 0,
}
