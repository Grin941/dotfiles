""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"     Grinenko Alexander
"
" Sections
"     -> General
"     -> VIM user interface
"     -> Plugins
"     -> Colors and Fonts
"
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""
" Show line numbers
set nu

" disable Background Color Erase when using tmux
set t_ut=
if !has('gui_running')
  set t_Co=256
endif

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

" JS indentation and syntax support
Plug 'pangloss/vim-javascript'

" JSX syntax highlighting and indenting
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>

" A code search tool
Plug 'mileszs/ack.vim'
if executable('ag')  " Execute ag if installed
  let g:ackprg = 'ag --vimgrep'
endif

" Elegant buffer explorer
Plug 'fholgado/minibufexpl.vim'

" The fancy start screen for vim
Plug 'mhinz/vim-startify'

" Show a diff with style
Plug 'mhinz/vim-signify'	

" Git support
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Asynchronous lint engine
Plug 'w0rp/ale'

" Vim plug for commenting
Plug 'scrooloose/nerdcommenter'

" A code completion engine
Plug 'valloric/youcompleteme'
let g:ycm_server_python_interpreter = '/usr/bin/python'

"Status/tabline
Plug 'itchyny/lightline.vim'
let g:lightline = {
	\  'colorscheme': 'gruvbox',
        \  'component': {
        \    'readonly': '%{&readonly?"⭤":""}',
        \  }
	\  }
set laststatus=2
"set guifont=Fura\ Mono\ Powerline
set guifont=PowerlineSymbols
"set guifont=Fira\ Mono\ for\ Powerline\ Regular
let g:Powerline_symbols = 'fancy'

" Fast file navigation
Plug 'wincent/command-t'

" Add icons to popular vim plugins
Plug 'ryanoasis/vim-devicons'

" Vim plugin stat displays tags in a windoe
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""
" Use gruvbox theme
" Link: http://vimawesome.com/plugin/gruvbox
let g:gruvbox_italic=1
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

set background=dark
