set comments=r:#

" comment current line
nnoremap <buffer> <LocalLeader>c I#<esc>

" Format on write
autocmd bufwritepre :normal gg=G

" Structutr Shortcuts
" if statments
nnoremap <leader>if iif ( ):<esc>bi
