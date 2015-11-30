""""""""""""""""""""""""""""""""""""""""
""""""""" pangdaxing23's vimrc """""""""
""""""""""""""""""""""""""""""""""""""""
" TODO: Remove redundancies, obsoletes. Get the broom out.

set nocompatible " be iMproved

call plug#begin('~/.vim/bundle')
" theme
" Plugin 'altercation/vim-colors-solarized' "solarized color scheme
Plug 'chriskempson/base16-vim'

Plug 'bling/vim-airline' "airline statusline
Plug 'bling/vim-bufferline' "display buffers on statusline

" Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive' "github integration
Plug 'tpope/vim-sensible' "sensible defaults

" ysiw" to surround word with "
" cs'} to change 'duck' to {duck}
Plug 'tpope/vim-surround' "surround text objects with quotes, tags, etc

Plug 'tpope/vim-repeat' "repeat plugin commands

Plug 'mattn/emmet-vim'

" press ctrl-n
Plug 'terryma/vim-multiple-cursors'

Plug 'scrooloose/syntastic' "syntax checking
" Plugin 'kien/ctrlp.vim' "
" Plugin 'majutsushi/tagbar' "

Plug 'ervandew/supertab' "tab for autocompletions

" gcc to comment line, gc to comment motion/visual mode selection, gcap paragraph, gcgc to uncomment set of adjacent lines
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise' "auto-add end, endif, etc
Plug 'jiangmiao/auto-pairs' "auto-add quotes, parens, brackets, carriage, etc

" press gf
Plug 'amix/open_file_under_cursor.vim'

Plug 'pangloss/vim-javascript'
Plug 'digitaltoad/vim-jade'

" On-demand loading
" mapped to Ctrl-h
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" mapped to F5"
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'nathanaelkane/vim-indent-guides', { 'on': 'IndentGuidesToggle' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

" Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Shougo/neocomplete.vim' | Plug 'Shougo/neosnippet-snippets' | Plug 'Shougo/neosnippet.vim'

" Add plugins to &runtimepath
call plug#end()

"" filetype plugin on

" change <Leader> key to ","
let mapleader=","

set shortmess=a " disable splash screen
set cmdheight=1 " command height of 1
set noshowmode " don't duplicate insert/replace/visual mode in statusbar
set showcmd " show command as it's being entered
set number " show line numbers
" set smartindent
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.
set hidden " allow to switch between buffers without saving
set laststatus=2 " Status bar always present, default is only on split
set antialias encoding=utf-8
set mouse=a " mouse mode, don't copy lines, scroll, etc.

" indents for certain filetypes
"FIXME: dont think this does anything, check later
autocmd FileType python setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2

" buffer switching shortcuts
map <left> :bprevious<CR>
map <right> :bnext<CR>

" nerd tree ctrl-h toggle
map <C-h> :NERDTreeToggle<CR>

" gundo F5 toggle
nnoremap <F5> :GundoToggle<CR>

" bufferline config
let g:bufferline_rotate = 1
let g:bufferline_fixed_index = -1 "always last

syntax enable " syntax highlighting
set background=dark " light/dark

" colorscheme
let base16colorspace=256  " Access colors present in 256 colorspace"
colorscheme base16-eighties

" airline
" airline colorscheme
let g:airline_theme='base16'

"fonts for special characters in airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

"comments are italic
highlight Comment cterm=italic
set t_ZH=[3m
set t_ZR=[23m

" different modes have different cursor shapes for tmux in iTerm
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" different modes for different cursor shapes in iTerm, no tmux
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"



" FIXME: don't really see why i need this...
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
  call togglebg#map("<F2")
endif
" End Terminal compatibility, whew that was a lot.

" Change emmet leader key to 'Z', so to expand, press 'Ctrl-Z', then ','
" let g:user_emmet_leader_key='<C-Z>'

" neocomplete
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" AutoComplPop like behavior.
" let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
" let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

