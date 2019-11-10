" Multiline comments
set comments=r:/*,mb:*,ex:*/
" Comment out current line shortcut
nnoremap <buffer> <LocalLeader>c I//<esc>
" Format indents on write
autocmd bufwritepre :normal gg=G

" Structure Shortcuts
" inserts an if statement
nnoremap <leader>if iif ( ) {<esc>o<cr>}<esc>2kf(la
" inserts an if else
nnoremap <leader>elif iif ( ) {<esc>o<cr>} else if ( ) {<cr><cr>}<esc>4kf(la
" inserts a for loop
nnoremap <leader>for ifor ( = ; ; ++) {<esc>o<cr>}<esc>2kf=ha
