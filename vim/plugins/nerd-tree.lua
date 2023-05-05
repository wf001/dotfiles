-- ########
-- NerdTree
-- ########
vim.cmd('let NERDTreeWinSize=18')
vim.cmd('autocmd vimenter * if !argc() | NERDTree | endif')
vim.cmd('autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif')
