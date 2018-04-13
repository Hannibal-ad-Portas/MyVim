" use vim pathogen as a package manager
execute pathogen#infect()

color badwolf
syntax enable

set tw=80 " Set the word wrapping to be at 80 characters
au FileType gitcommit set tw=72 "Set the word wrap for git commits only

set tabstop=4		" Number of visual spaces per tab
set softtabstop=4	" Number of spaces in tabs when editing

set number		" turn on line number
set showcmd		" show command in bottom bar
set cursorline		" hilight current line
set cursorcolumn	" highlight current column

filetype plugin indent on

set autoindent


set wildmenu		" visual autocomplete for command menu
"set lazyredraw		" only redraw when needed
set showmatch		" hilights matching [{()}]

" searching
set incsearch		" search as characters are entered
set hlsearch		" hilights matches
"  turn off search hilight by pressing space
nnoremap <leader><space> :nohlsearch<CR>

" Folding
set foldenable			" enables foldiong
set foldlevelstart=10	" opens the first ten levels of folds
set foldnestmax=10		" sets the maximum nests
" za opens and closes folds
nnoremap <space> za
set foldmethod=indent	" fold based on indent

let mapleader=","		"leader is a comma
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
