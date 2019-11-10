" Multiline comments
set comments=l:#
" Comment out current line shortcut
nnoremap <buffer> <LocalLeader>c I#<esc>
" Format indents on write
autocmd bufwritepre :normal gg=G

" Structure Shortcuts
" inserts an if statement
nnoremap <leader>if iif [  ] ; do<esc>o<esc>ofi<esc>02kf[a
" inserts an if else
nnoremap <leader>elif iif [ <esc>mzi   ] ; do<esc>o<esc>myoelse<esc>o<esc>mxofi<esc>`za
