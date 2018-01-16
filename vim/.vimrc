""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"     Grinenko Alexander
"
" Sections
"     -> General
"     -> VIM user interface
"     -> Plugins
"     -> Colors and Fonts
"     -> Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""
" Show line numbers
set nu

" disable Background Color Erase when using tmux
set t_ut=
"if !has('gui_running')
"  set t_Co=256
"endif

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread


""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu
set wildmode=list:longest,full

"Always show current position
set ruler

" Add a bit extra margin to the left
set foldcolumn=1


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'morhetz/gruvbox'

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" A code search tool
Plug 'mileszs/ack.vim'
if executable('ag')  " Execute ag if installed
  let g:ackprg = 'ag'
endif

" Elegant buffer explorer
Plug 'fholgado/minibufexpl.vim'
set hidden  " Prevent syntax off when closing buffer

" The fancy start screen for vim
Plug 'mhinz/vim-startify'

" Show a diff with style
Plug 'mhinz/vim-signify'	

" Git support
Plug 'tpope/vim-fugitive'

" A code completion engine
Plug 'valloric/youcompleteme'
let g:ycm_server_python_interpreter = '/home/alexander/.pyenv/shims/python'
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>

"Status/tabline
Plug 'itchyny/lightline.vim'
let g:lightline = {
	\ 'colorscheme': 'gruvbox',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component': {
	\   'lineinfo': ' %3l:%-2v',
	\ },
	\ 'component_function': {
	\   'readonly': 'LightlineReadonly',
	\   'fugitive': 'LightlineFugitive'
	\ },
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': '' }
	\ }
	function! LightlineReadonly()
		return &readonly ? '' : ''
	endfunction
	function! LightlineFugitive()
		if exists('*fugitive#head')
			let branch = fugitive#head()
			return branch !=# '' ? ''.branch : ''
		endif
		return ''
	endfunction
set laststatus=2
set noshowmode  " Prevent Vim default mode information
set guifont=PowerlineSymbols
let g:Powerline_symbols = 'fancy'

" Add icons to popular vim plugins
Plug 'ryanoasis/vim-devicons'

" Vim plugin stat displays tags in a window
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" Activate the versions and the virtualenvs of pyenv 
" within a live VIM session
Plug 'lambdalisue/vim-pyenv'

" Syntax checking for vim
Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" A nicer Python indentation style for vim.
Plug 'Vimjas/vim-python-pep8-indent'

" Enhanced javascript syntax file
Plug 'jelera/vim-javascript-syntax'

" Vastly improved Javascript indentation and syntax support
Plug 'pangloss/vim-javascript'

" A Vim plugin for visually displaying indent levels in code
Plug 'nathanaelkane/vim-indent-guides'

" Vim plugin, provides insert mode auto-completion for quotes, parens,
" brackets, etc.
Plug 'Raimondi/delimitMate'

" Tern plugin for Vim
Plug 'marijnh/tern_for_vim'

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""
" Use gruvbox theme
" Link: http://vimawesome.com/plugin/gruvbox
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
set background=dark


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers navigation
nmap <C-K> :bnext<cr>
nmap <C-J> :bprev<cr>
nmap <C-L> :b#<cr>
