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

" Run your favorite search tool from VIM
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag'  " Use the_silver_search tool

" Elegant buffer explorer
Plug 'fholgado/minibufexpl.vim'

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" a GIT wrapper
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""
" Use gruvbox theme
" Link: http://vimawesome.com/plugin/gruvbox
"let g:gruvbox_italic=1
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

set background=dark

