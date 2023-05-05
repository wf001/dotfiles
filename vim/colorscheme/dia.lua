local colors = {
  color2   = '#4f4449',
  color3   = '#D32F2F',
  color4   = '#ffffff',
  color5   = '#ffeb3b',
  color8   = '#f07178',
  color9   = '#ffccaa',
  color10  = '#fb8c00',
  color13  = '#3949ab',
}

return {
  normal = {
    a = { fg = colors.color2, bg = colors.color10, gui = 'bold' },
    b = { fg = colors.color2, bg = colors.color5 },
    c = { fg = colors.color4, bg = colors.color2 },
  },
  inactive = {
    a = { fg = colors.color4, bg = colors.color5, gui = 'bold' },
    b = { fg = colors.color4, bg = colors.color5 },
    c = { fg = colors.color4, bg = colors.color2 },
  },
  insert = {
    a = { fg = colors.color4, bg = colors.color13, gui = 'bold' },
    b = { fg = colors.color2, bg = colors.color5 },
  },
  visual = {
    a = { fg = colors.color4, bg = colors.color3, gui = 'bold' },
    b = { fg = colors.color2, bg = colors.color5 },
  },
  replace = {
    a = { fg = colors.color4, bg = colors.color8, gui = 'bold' },
    b = { fg = colors.color2, bg = colors.color5 },
  },
}
