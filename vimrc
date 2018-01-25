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

" Dark powered asynchronous completion framework for neovim/Vim8
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Install neovim for python3:
" pip3 install neovim
" See: https://stackoverflow.com/questions/6587507/how-to-install-pip-with-python-3
" for python3 errors.
set pyxversion=3
let g:deoplete#enable_at_startup = 1

"Status/tabline
Plug 'itchyny/lightline.vim'
let g:lightline = {
	\ 'colorscheme': 'gruvbox',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
        \   'right': [ ['lineinfo'], ['percent'],
	\              ['linter_warnings', 'linter_errors', 'linter_ok'] ]
	\ },
	\ 'component': {
	\   'lineinfo': ' %3l:%-2v',
	\ },
	\ 'component_function': {
	\   'readonly': 'LightlineReadonly',
	\   'fugitive': 'LightlineFugitive',
	\   'linter_warnings': 'LightLineLinterWarnings',
	\   'linter_errors': 'LightLineLinterErrors',
	\   'linter_ok': 'LightLineLinterOK'
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
	function! LightlineLinterWarnings() abort
		let l:counts = ale#statusline#Count(bufnr(''))
		let l:all_errors = l:counts.error + l:counts.style_error
		let l:all_non_errors = l:counts.total - l:all_errors
		return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
	endfunction
	function! LightlineLinterErrors() abort
		let l:counts = ale#statusline#Count(bufnr(''))
		let l:all_errors = l:counts.error + l:counts.style_error
		let l:all_non_errors = l:counts.total - l:all_errors
		return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
	endfunction
	function! LightlineLinterOK() abort
		let l:counts = ale#statusline#Count(bufnr(''))
		let l:all_errors = l:counts.error + l:counts.style_error
		let l:all_non_errors = l:counts.total - l:all_errors
		return l:counts.total == 0 ? '✓ ' : ''
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

" Enhanced javascript syntax file
Plug 'jelera/vim-javascript-syntax'

" Vastly improved Javascript indentation and syntax support
Plug 'pangloss/vim-javascript'

" A Vim plugin for visually displaying indent levels in code
Plug 'nathanaelkane/vim-indent-guides'

" Tern plugin for Vim
Plug 'marijnh/tern_for_vim'

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Take Notes in rst
Plug 'Rykka/riv.vim'

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

" Highlights tralling string if it contains > 80 symbols
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%82v.\+/


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers navigation
nmap <C-K> :bnext<cr>
nmap <C-J> :bprev<cr>
nmap <C-L> :b#<cr>

" Search for the word under cursor in the current directory
nmap <leader>f mo:Ack! "\b<cword>\b" <CR>
