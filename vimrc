" VUNDEL {{{
set nocompatible	" be iMproved, required
filetype off		" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Color Scheme
Plugin 'sjl/badwolf'

" Git integration
Plugin 'tpope/vim-fugitive'

" linting - automatic error finding
Plugin 'w0rp/ale'

" Graphical Undo Tree
Plugin 'sjl/gundo.vim'

Plugin 'junegunn/limelight.vim'

" Move visual blocks around
Plugin 'zirrostig/vim-schlepp'

Plugin 'sophacles/vim-processing'

" Make working with LaTeX not painfull
Plugin 'lervag/vimtex'

" Error checking on buffer write
Plugin 'scrooloose/syntastic'

" Move between tmux pains and vim splits
Plugin 'christoomey/vim-tmux-navigator'

" Put thinkgs around things with vim movements
Plugin 'tpope/vim-surround'

" Save the Session config
Plugin 'tpope/vim-obsession'

" UML Diagrams in vim? Yes please
" This does require the PlantUML jar ion your path
Plugin 'scrooloose/vim-slumlord'
Plugin 'aklt/plantuml-syntax'

" vimwiki
Plugin 'vimwiki/vimwiki'

" Put information at the bottom of the screen
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'powerline/powerline'

"See colors in the file
Plugin 'chrisbra/colorizer'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" }}}

" GLOBAL {{{
let mapleader = ","
" Set runtime path to read files in ~/.vim/misk
" This is where I keep smaller personal plugins
set rtp+=~/.vim/misk/*
set nocompatible
set modelines=1
"keep long longs from slowing vim down too much
set synmaxcol=200
set wildmenu		" visual autocomplete for command menu
set wildmode=list:longest,full	"Show lists of completions
" and complete as much as possible,
set infercase	"adjust completions to match case
set splitbelow
set splitright

"turn off the ruler and turn on statusline
set noru
set laststatus=2

map <leader>c :!compiler <c-r>%<CR>
" }}}

" APPEARANCE {{{
set encoding=utf-8
"Use the badwolf color scheme
color badwolf
syntax enable
set background=dark
" Make Comments More Visible
highlight Comment term=bold ctermfg=white
highlight Visual	ctermfg=Yellow ctermbg=26	"26 = Dusty Blue Background	
highlight SpecialKey cterm=bold ctermfg=Blue

filetype plugin indent on

set tabstop=4		"Number of visual spaces per tab
set softtabstop=4	"Number of spaces in tabs when editing
set shiftround		"Always indent to the nearest tabstop
set shiftwidth=4	"Set preferred indent size for smartindent
set smarttab		"Use shiftwidths at left margin, tabstops everywhere else

set listchars=tab:>-,trail:·
set list
set relativenumber "turn on relative line number
set number		" turn on line number
set showcmd		" show command in bottom bar
set cursorline		" highlight current line
set cursorcolumn	" highlight current column
set showmatch		" highlights matching [{()}]

" Don't let airline use powerline fonts it doesn't seem to be working with st
let g:airline_powerline_fonts = 0

" }}}

" Show when lines extend past column 80 {{{
highlight ColorColumn ctermfg=208 ctermbg=Black

function! MarkMargin (on)
	if exists('b:MarkMargin')
		try
			call matchdelete(b:MarkMargin)
		catch /./
		endtry
		unlet b:MarkMargin
	endif
	if a:on
		let b:MarkMargin = matchadd('ColorColumn', '\%81v\s*\zs\S', 100)
	endif
endfunction

augroup MarkMargin
	autocmd!
	autocmd BufEnter	*		:call MarkMargin(1)
	autocmd BufEnter	*.vp*	:call MarkMargin(0)
augroup END
" }}}

" SmartIndent {{{
set autoindent	"Retain indentation on new line
set smartindent	"Turn on autoindenting of blocks

let g:vim_indent_cont = 0

function! ShiftLine()
	set nosmartindent
	normal! >>
	set smartindent
endfunction`

" }}}

" searching {{{
set incsearch		" search as characters are entered
set hlsearch		" highlight matches
"  turn off search highlighting by pressing space
nnoremap <leader><Space> :nohlsearch<CR>
" }}}

" Folding {{{
set foldenable			" enables folding
set foldlevelstart=10	" opens the first ten levels of folds
set foldnestmax=10		" sets the maximum nests

" za opens and closes folds
nnoremap <space> za
set foldmethod=indent	" fold based on indent
" }}}

" Visual Mode Adjustments {{{
"Set default behavior to visual block
nnoremap v <C-V>
nnoremap <C-V> v

xnoremap v <C-V>
xnoremap <C-V> v

"Square up visual selections
set virtualedit=block

"Set BS/DL to delete selected text in visual mode
xmap <BS> x

"Make vaa select the entire file
xmap aa VGo1G

" Arrow Keys move visual blocks
xmap <up>		<Plug>SchleppUp
xmap <down>		<Plug>SchleppDown
xmap <left>		<Plug>SchleppLeft
xmap <right>	<Plug>SchleppRight

xmap D			<Plug>SchleppDupLeft
xmap <C-D>		<plug>SchleppDupLeft
" }}}

" General Remappings {{{
"open vimrc in vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"source my vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
"open a text file for writing notes in the current directory
nnoremap <leader>en :vsplit ./notes<cr>
"Change Word to Uppercase in insert mode
inoremap <c-d> <esc> viw U i
"highlight last inserted text
nnoremap gV '[v']

"use space to jump down a page
nnoremap <Space> <PageDown>
xnoremap <Space> <PageDown>

"Indent/Outdent current block
nmap >> $>i}''
nmap << $<i}''

"remaps to navigate vim splits easily
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Move vim splits
map <C-H> <C-w>H
map <C-J> <C-w>J
map <C-K> <C-w>K
map <C-L> <C-w>L

"Remap for quick Ex commands
nnoremap ; :
xnoremap : ;

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

"Replace all with S
nnoremap <leader>S :%s///g<left><left><left>

"Spellcheck on F6
map <F6> :setlocal spell! spelllang=en_us<CR>

"Get line and work count with F3
map <F3> :!wc <C-R>%<CR>

" }}}

" Cut and paste from the system clipboard {{{

" When in Normal mode, paste over the current line...
nmap  <C-P> 0d$"*p

" When in Visual mode, paste over the selected region...
xmap  <C-P> "*pgv

" In Normal mode, yank the entire buffer...
nmap <C-C> 1G"*yG``:call YankedToClipboard()<CR>

" In Visual mode, yank the selection...
xmap  <C-C> "*y:call YankedToClipboard()<CR>

function! YankedToClipboard ()
	let block_of = (visualmode() == "\<C-V>" ? 'block of ' : '')
	let N = strlen(substitute(@*, '[^\n]\|\n$', '', 'g')) + 1
	let lines = (N == 1 ? 'line' : 'lines')
	echo block_of . N lines 'yanked to clipboard'
endfunction
" }}}

" allows cursor change in tmux mode {{{
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}

" BOOT CAMP {{{
nnoremap	<left>	<nop>
nnoremap	<right>	<nop>
nnoremap	<up>	<nop>
nnoremap	<down>	<nop>
"}}}

" ABBREVIATIONS {{{
iabbrev hellow hello
iabbrev Hellow Hello
"}}}

" Auto commands {{{
" Strip trailing white space
autocmd BufWritePre :<C-U>call StripTrailingWhitespace()<CR>
" }}}

" Status line {{{
set statusline=%f
set statusline+=\ -
set statusline+=FileType:
set statusline+=%y
set statusline+=%=
set statusline+=%{FugitiveStatusline()}
" }}}

" Word Processing {{{
" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" vimtec settings
" viewer
	let g:vimtex_view_method = 'zathura'
" }}}

" special settings for this file.
" vim:foldmethod=marker:foldlevel=0
