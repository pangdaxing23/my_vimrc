""""""""""""""""""""""""""""""""""""""""
""""""""" pangdaxing23's vimrc """""""""
""""""""""""""""""""""""""""""""""""""""
" TODO: Remove redundancies, obsoletes. Get the broom out.

set nocompatible " be iMproved

call plug#begin('~/.vim/bundle')
" theme
" Plug 'chriskempson/base16-vim'
Plug 'junegunn/seoul256.vim'
Plug 'altercation/vim-colors-solarized' "solarized color scheme

Plug 'bling/vim-airline' "airline statusline
Plug 'vim-airline/vim-airline-themes' "airline themes
Plug 'bling/vim-bufferline' "display buffers on statusline

" Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive' "github integration
Plug 'tpope/vim-sensible' "sensible defaults
Plug 'airblade/vim-gitgutter' "git gutter

" ysiw" to surround word with "
" cs'} to change 'duck' to {duck}
Plug 'tpope/vim-surround' "surround text objects with quotes, tags, etc
Plug 'tpope/vim-repeat' "repeat plugin commands
Plug 'tpope/vim-eunuch' "unix helpers, :Move, :Rename, :Remove, :Wall, :Mkdir, :Chmod
Plug 'tpope/vim-speeddating' " inc/decrement dates with <C-a>/<C-x>
Plug 'mattn/emmet-vim' " let g:user_emmet_leader_key='<C-Y>'
Plug 'KabbAmine/vCoolor.vim' "color picker

" press ctrl-n
Plug 'terryma/vim-multiple-cursors'

Plug 'scrooloose/syntastic' "syntax checking
Plug 'ctrlpvim/ctrlp.vim' "fuzzy file, buffer, tag, etc finder
" Plug 'majutsushi/tagbar' "

Plug 'ervandew/supertab' "tab for autocompletions

" gcc to comment line, gc to comment motion/visual mode selection, gcap paragraph, gcgc to uncomment set of adjacent lines
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise' "auto-add end, endif, etc
Plug 'jiangmiao/auto-pairs' "auto-add quotes, parens, brackets, carriage, etc

" Note: What is different from the native version of this???
" press gf
Plug 'amix/open_file_under_cursor.vim'
Plug 'severin-lemaignan/vim-minimap'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx' " jsx highlighting

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "mapped to Ctrl-h
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' } "mapped to F5
Plug 'nathanaelkane/vim-indent-guides', { 'on': 'IndentGuidesToggle' }
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'chrisbra/Colorizer', { 'for': 'css' }
Plug 'gregsexton/MatchTag', { 'for': 'html' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
" Group dependencies, i.e: vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'ryanss/vim-hackernews' "yeaaaaa

" Add plugins to &runtimepath
call plug#end()

" change <Leader> key to ','
let mapleader=","

set shortmess=a " disable splash screen
set cmdheight=1 " command height of 1
set noshowmode " don't duplicate insert/replace/visual mode in statusbar
set showcmd " show command as it's being entered
set wildmenu
set wildmode=list:longest,full
set visualbell " no beep
set number " show line numbers
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set breakindent " smart wrap
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set cursorline " highlight current line
set scrolloff=2 " scroll offset at page edges
set gdefault " use the `g` flag by default.
set hidden " allow to switch between buffers without saving
set autoread " auto reread files changed outside of vim
set laststatus=2 " Status bar always present, default is only on split
set antialias encoding=utf-8
set mouse=a " mouse mode, don't copy lines, scroll, etc.

" make Y behave like C and D
nmap Y y$

" allow capitals for common commands
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev E e

" <leader> p toggles paste mode
nmap <leader>p :set paste!<cr>

nmap <leader>l :set list!<cr>

" indents for certain filetypes
" FIXME: dont think this does anything, check later
" FIXME: should probably set default to tabwidth 2, set to 4 for C, etc.
autocmd FileType c setlocal shiftwidth=4 softtabstop=4 tabstop=4
" autocmd FileType python setlocal shiftwidth=2 softtabstop=2 tabstop=2
" autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2 tabstop=2
" autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
" autocmd FileType pug setlocal shiftwidth=2 softtabstop=2 tabstop=2
" autocmd FileType tex setlocal shiftwidth=2 softtabstop=2 tabstop=2

" buffer/tab switching shortcuts
nnoremap <left> :bprevious<CR>
nnoremap <right> :bnext<CR>
nnoremap <S-left> :tabp<CR>
nnoremap <S-right> :tabn<CR>

" nerd tree ctrl-h toggle
map <C-h> :NERDTreeToggle<CR>

" C-p for ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" exclude files in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" gundo F5 toggle
nnoremap <F5> :GundoToggle<CR>
" Note: hardly works, gets error messages usually. consider removing.
let g:gundo_prefer_python3 = 1

" bufferline config
let g:bufferline_rotate = 1
let g:bufferline_fixed_index = -1 "always last
let g:bufferline_echo = 0 "no command bar echo

let g:colorizer_auto_filetype='css,html'

syntax enable "syntax highlighting

" colorscheme
let base16colorspace=256  " Access colors present in 256 colorspace
"colorscheme base16-eighties
colorscheme seoul256
let g:seoul256_background = 236 " 233 to 239

set background=dark "light/dark

" airline
" airline colorscheme
let g:airline_theme='base16'

"fonts for special characters in airline
let g:airline_powerline_fonts = 1

let g:airline_section_y = ""

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

if $TERM != 'screen-256color'
  " comments are italic
  highlight Comment cterm=italic
  set t_ZH=[3m
  set t_ZR=[23m
endif

" set list highlights spaces
set listchars=tab:\|_,trail:·,space:·

" different modes for different cursor shapes in iTerm, no tmux
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

if $TERM == 'screen-256color'
  " different modes have different cursor shapes for tmux in iTerm
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

" FIXME: split between here and gvimrc
" Terminal compatibility
if colors_name == 'solarized'
  if has('gui_macvim')
    set transparency=0
  endif
  if !has('gui_running')
    let g:solarized_termtrans=1
    if (&t_Co < 256 && $TERM != 'xterm-256color')
      let g:solarized_termcolors=16
    endif
    if $TERM_PROGRAM == 'Apple_Terminal'
      let g:solarized_termcolors = &t_Co
    endif
  endif
  call togglebg#map("<F2>")
endif
" End Terminal compatibility, whew that was a lot.

