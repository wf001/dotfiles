require('aerial').setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', 'a[', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    vim.keymap.set('n', 'a]', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set('n', 'aa', '<cmd>AerialToggle!<CR>')

