" Maintainer:
"     Grinenko Alexander
"
" Sections:
"     -> General
"     -> VIM user interface
"     -> Plugins
"     -> Colors and Fonts
"     -> Navigation
"     -> Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" Show line numbers
set nu

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Set standart file encoding
set encoding=utf8

" clipboard
set clipboard=unnamed
vnoremap <C-c> "+y

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

" Open new splits at the bottom and right
set splitbelow
set splitright


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'ajmwagar/vim-deus'
Plug 'rakr/vim-one'

" A collection of language packs for Vim
Plug 'sheerun/vim-polyglot'

" A code search tool
Plug 'rking/ag.vim'

" Show a diff with style
Plug 'mhinz/vim-signify'	

" Git support
Plug 'tpope/vim-fugitive'

" Find And Replace Vim plugin
Plug 'brooth/far.vim'

" Dark powered asynchronous completion framework for neovim/Vim8
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" Rust autocomplete
Plug 'sebastianmarkow/deoplete-rust'
" Read https://github.com/racer-rust/racer
let g:deoplete#sources#rust#racer_binary = $HOME . '/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = systemlist('rustc --print sysroot')[0] . '/lib/rustlib/src/rust/src'

" Python autocomplete
Plug 'zchee/deoplete-jedi'
let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'

" Haskell autocomplete
Plug 'eagletmt/neco-ghc'

" Javascript autocomplete
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

" Typescript autocomplete
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" Yet Another TypeScript Syntax: The most advanced TypeScript Syntax Highlighting in Vim
Plug 'HerringtonDarkholme/yats.vim'

" Custom Haskell Vimscripts
Plug 'neovimhaskell/haskell-vim'

" Vim Haskell Hindent integration plugin
Plug 'alx741/vim-hindent'

" A neovim plugin for Intero, forked from ghcmod-vim
Plug 'parsonsmatt/intero-neovim'
augroup interoMaps
  au!
  " Automatically reload on save
  au BufWritePost *.hs InteroReload
augroup END
let g:intero_start_immediately = 1
let g:intero_type_on_hover = 1
let g:intero_window_size = 80
let g:intero_vertical_split = 1
set updatetime=1000

" A Vim plugin for Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Asynchronous lint engine
Plug 'w0rp/ale'
" After this is configured, :ALEFix will try and fix your code with linter.
let g:ale_fixers = {
\   'python': ['flake8'],
\   'haskell': ['hlint'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'vue': ['prettier'],
\   'yaml': ['prettier'],
\   'json': ['prettier'],
\}
" Select specific linters
let g:ale_linters = {
\   'python': ['flake8'],
\   'haskell': ['hlint'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'vue': ['prettier'],
\   'yaml': ['prettier'],
\   'json': ['prettier'],
\}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

" Status/tabline
Plug 'itchyny/lightline.vim'
let g:lightline = {
        \ 'colorscheme': 'one',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component': {
	\   'lineinfo': ' %3l:%-2v',
        \   'filename': '%n:%t',
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

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nmap <Leader>t :Files<CR>
nmap <Leader>r :History<CR>
nmap <Leader>c :Commits<CR>
nmap <Leader>bc :BCommits<CR>
nmap ; :Buffers<CR>

" Vim syntax highlighting for Vue components
Plug 'posva/vim-vue'

" Vim syntax for TOML
Plug 'cespare/vim-toml'

" emmet for vim: http://emmet.io/
Plug 'mattn/emmet-vim'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (has("termguicolors"))
  set termguicolors
endif

if !has('gui_running')
  set t_Co=256
endif

" Tmux support
set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum

" Use atom one dark theme
set background=dark
let g:one_allow_italics = 1
colorscheme one


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

" Tabs navigation
nmap <Tab> :tabprevious<cr>
nmap <S-Tab> :tabnext<cr>

" :terminal
tnoremap <Esc> <C-\><C-n>


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=2 sts=2 sw=2
autocmd FileType ts setlocal ts=2 sts=2 sw=2
autocmd FileType js setlocal ts=4 sts=4 sw=4
autocmd FileType c setlocal ts=4 sts=4 sw=4
autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType py setlocal ts=4 sts=4 sw=4
