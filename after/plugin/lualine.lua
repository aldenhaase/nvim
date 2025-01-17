local colors = require("cyberdream.colors").default
local opts = require("cyberdream.config").options

if opts.transparent then
    colors.bg = "NONE"
end

require('lualine').setup {
  options = {
    theme = cyberdream,
    component_separators = '',
    section_separators = {},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {{ 'filename', path = 1}},
    lualine_c = {},
    lualine_x = { 'branch'},
    lualine_y = {{ 'diff',
                    symbols    = { added = " ",
                                   modified = " ",
                                   removed = " "
                                 },
                    diff_color = { added    = { fg = colors.green },
                                   modified = { fg = colors.orange },
                                   removed  = { fg = colors.red },
                                 },
                }},
    lualine_z = {'location',},
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
