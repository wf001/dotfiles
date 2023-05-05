vim.cmd("autocmd BufRead *.php nnoremap <C-F> :!npx prettier --write %<CR>")
