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

" A code search tool
Plug 'mileszs/ack.vim'
if executable('ag')  " Execute ag if installed
  let g:ackprg = 'ag'
endif

" Show a diff with style
Plug 'mhinz/vim-signify'	

" Git support
Plug 'tpope/vim-fugitive'

" Dark powered asynchronous completion framework for neovim/Vim8
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Install neovim for python3:
" sudo apt-get install python3-pip
" python3 -m pip install setuptools
" python3 -m pip install neovim
set pyxversion=3
let g:deoplete#enable_at_startup = 1

" Asynchronous lint engine
Plug 'w0rp/ale'
" After this is configured, :ALEFix will try and fix your Python code with
" flake8 linter.
let g:ale_fixers = {
\   'python': ['flake8'],
\}
" Select specific linters
let g:ale_linters = {
\   'python': ['flake8'],
\}

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

" Vim plugin stat displays tags in a window
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" Vastly improved Javascript indentation and syntax support
Plug 'pangloss/vim-javascript'

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nmap <Leader>t :Files<CR>
nmap <Leader>r :History<CR>
nmap <Leader>c :Commits<CR>
nmap <Leader>bc :BCommits<CR>
nmap ; :Buffers<CR>

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

" netrw navifation
map <F2> :Vexplor.<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
