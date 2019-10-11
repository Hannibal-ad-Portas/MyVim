" Multiline comments
set comments=r:/*,mb:*,ex:*/
" Comment out current line shortcut
nnoremap <buffer> <LocalLeader>c I//<esc>
" Format indents on write
autocmd bufwritepre :normal gg=G

" Structure Shortcuts
" inserts an if statement
nnoremap <leader>if iif ( ) {<esc>o<return>}<esc>2kf(la
" inserts an if else
nnoremap <leader>elif iif ( ) {<esc>o<return>} else if ( ) {<return><return>}<esc>4kf(la
" inserts a for loop
nnoremap <leader>for ifor ( = ; ; ++) {<esc>o<esc>o}<esc>2kf=ha
