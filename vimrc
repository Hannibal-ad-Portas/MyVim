"=======[ Global ]========
let mapleader = ","

"=======[ Plugins ]=======
" use vim pathogen as a package manager
execute pathogen#infect()

"=======[ Appearance ]===
"Use the badwolf color scheam
color badwolf
syntax enable
" Make Comments More Visible
highlight Comment term=bold ctermfg=white
highlight Visual	ctermfg=Yellow ctermbg=26	"26 = Dusty Blue Background	
highlight SpecialKey cterm=bold ctermfg=Blue

filetype plugin indent on

set tabstop=4		"Number of visual spaces per tab
set softtabstop=4	"Number of spaces in tabs when editing
set shiftround		"Always indent to the nearist tabstop
set smarttab		"Use shiftwidths at left margin, tabstops everywhere else

set number		" turn on line number
set showcmd		" show command in bottom bar
set cursorline		" hilight current line
set cursorcolumn	" highlight current column


"=======[ Show when lines extend past column 80 ]==========
highlight ColorColumn ctermfg=208 ctermbg=Black

function MarkMargin (on)
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

" SmartIndent Set up
set autoindent	"Retain indentation on new line
set smartindent	"Turn on autoindenting of blocks

let g:vim_indent_cont = 0

function! ShiftLine()
	set nosmartindent
	normal! >>
	set smartindent
endfunction`


set wildmenu		" visual autocomplete for command menu
set lazyredraw		" only redraw when needed
set showmatch		" hilights matching [{()}]
"keep long longs from slowing vim down too much
set synmaxcol=200

" searching
set incsearch		" search as characters are entered
set hlsearch		" hilights matches
"  turn off search highlighting by pressing space
nnoremap <leader><Space> :nohlsearch<CR>

" Folding
set foldenable			" enables foldiong
set foldlevelstart=10	" opens the first ten levels of folds
set foldnestmax=10		" sets the maximum nests
" za opens and closes folds
nnoremap <space> za 
set foldmethod=indent	" fold based on indent

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

"======[ Visual Mode Adjustments ] ======
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

"=====[ Arrow Keys move visual blocks ]===
xmap <up>		<Plug>SchleppUp
xmap <down>		<Plug>SchleppDown
xmap <left>		<Plug>SchleppLeft
xmap <right>	<Plug>SchleppRight

xmap D			<Plug>SchleppDupLeft
xmap <C-D>		<plug>SchleppDupLeft

set wildmode=list:longest,full	"Show lists of completions 
								" and complete as much as possible,
								" the iterate full completion
set infercase	"adjust completions to match case

set updatecount=10

"=======[ General Remappings ]=========
"use space to jump down a page
nnoremap <Space> <PageDown>
xnoremap <Space> <PageDown>

"Indent/Outdent current block
nmap %% $>i}''
nmap $$ $<i}''

"remaps for vim split       
map <C-h> <C-w>h            
map <C-j> <C-w>j            
map <C-k> <C-w>k            
map <C-l> <C-w>l            
                            
"Remap for quick Ex commands
nnoremap ; :
xnoremap : ;

"=====[ Cut and paste from the system clipboard ]====================

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

"====[ Pathogen Support ]====================
call pathogen#infect()
call pathogen#helptags()