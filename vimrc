""""""""""""""""""""""""""""""""""""""""
"""""""""pangdaxing23's vimrc"""""""""""
""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugins on GitHub repo

Plugin 'tpope/vim-fugitive' "github integration
Plugin 'tpope/vim-sensible' "sensible defaults
Plugin 'tpope/vim-surround' "surround text objects with quotes, tags, etc
Plugin 'bling/vim-airline' "airline statusline
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-repeat'

Plugin 'altercation/vim-colors-solarized' "solarized color scheme
"Plugin 'chriskempson/vim-tomorrow-theme'
"Plugin 'chriskempson/base16-vim'

Plugin 'scrooloose/nerdtree' "
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'Shougo/neocomplcache.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'

"press ctrl-n"
Plugin 'terryma/vim-multiple-cursors'

"press gf"
Plugin 'amix/open_file_under_cursor.vim'

Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
"
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/neosnippet.vim'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"change <Leader> key to ","
let mapleader=","

set shortmess=a "disable splash screen
set cmdheight=1 "command height of 1

set number "show line numbers
set smartindent
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
autocmd FileType python setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2

set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

"Buffer switching shortcuts
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr> 

syntax enable "syntax highlighting
set background=dark "change to background=light for light theme

"A bunch of Terminal Compatibility
if !has('gui_running')
    " Compatibility for Terminal
    let g:solarized_termtrans=1

    if (&t_Co >= 256 || $TERM == 'xterm-256color')
        " Do nothing, it handles itself.
    else
        " Make Solarized use 16 colors for Terminal support
        let g:solarized_termcolors=16
    endif
endif

colorscheme solarized

if colors_name == 'solarized'
  if has('gui_macvim')
    set transparency=0
  endif

  if !has('gui_running') && $TERM_PROGRAM == 'Apple_Terminal'
    let g:solarized_termcolors = &t_Co
    let g:solarized_termtrans = 1
    colorscheme solarized
  endif

  call togglebg#map("<F2>")
endif

set anti enc=utf-8
set guifont=Sauce\ Code\ Pro\ for\ Powerline
"End Terminal compatibility, whew that was a lot.

"airline settings
"Status bar always present, default is only on split
set laststatus=2

"set airline theme
let g:airline_theme='solarized'

"fonts for special characters in airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

"Change emmet leader key to 'Z', so to expand, press 'Ctrl-Z', then ','
"let g:user_emmet_leader_key='<C-Z>'