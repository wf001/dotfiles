-- #############
-- vim-iced
-- #############
vim.cmd("let g:iced_enable_default_key_mappings = v:true")
vim.cmd("let g:iced_formatter = 'cljstyle'")
-- --make IcedFormatAll error
--vim.cmd("let g:iced_enable_clj_kondo_analysis = v:true")
--vim.cmd("let g:ale_set_loclist = v:true")
vim.cmd('autocmd VimEnter *.clj,*cljc IcedConnect')

-- --basic keymap
vim.cmd("autocmd BufRead *.clj,*.cljc nnoremap <leader>c :IcedConnect<CR>")
vim.cmd("autocmd BufRead *.clj,*.cljc nnoremap <leader>d :IcedDefJump<CR>")
vim.cmd("autocmd BufRead *.clj,*.cljc nnoremap <leader>a :IcedDocumentPopupOpen<CR>")
vim.cmd("autocmd BufRead *.clj,*.cljc nnoremap <leader>f :Rgrep<CR>")
vim.cmd("autocmd BufRead *.clj,*.cljc nnoremap F :IcedFormatAll<CR>")
-- --not working
vim.cmd("autocmd BufRead *.clj,*.cljc nmap <leader>r :IcedRenameSymbol<CR>")

-- --special keymap
vim.cmd("autocmd BufRead *.clj,*.cljc nnoremap <leader>x :IcedClojureDocsOpen<CR>")
vim.cmd("autocmd BufRead *.clj,*.cljc nnoremap <leader>v :IcedSourceShow<CR>")
vim.cmd("autocmd BufRead *.clj,*.cljc nnoremap <leader>qq :IcedDocumentClose<CR>")
vim.cmd("autocmd BufRead *.clj,*.cljc imap <C-n> <C-x><C-o>")
vim.cmd("autocmd BufRead *.clj,*.cljc nnoremap <leader>< :IcedBarf<CR>")
vim.cmd("autocmd BufRead *.clj,*.cljc nnoremap <leader>> :IcedSlurp<CR>")
vim.cmd("autocmd BufRead *.clj,*.cljc nmap <leader>g <leader>ee<CR>")

