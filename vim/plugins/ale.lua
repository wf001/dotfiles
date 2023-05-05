-- #############
-- ale
-- #############
vim.cmd("let g:ale_linters_explicit = 1")
vim.cmd("let g:ale_linters = {'clojure': ['clj-kondo']}")
vim.cmd("autocmd BufRead *.clj,*.cljc nnoremap <leader>e :ALEPopulateLocList<CR>")

