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
Plugin 'Shougo/neocomplcache.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'
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

set shortmess=a "disable splash screen
set cmdheight=1 "command height of 1

set number "show line numbers

set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

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
set guifont=Source\ Code\ Pro\ for\ Powerline
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




"....
set statusline+=%{StatuslineLongLineWarning()}
"....

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")
        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)

    let long_line_lens = []

    let i = 1
    while i <= line("$")
        let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
        if len > threshold
            call add(long_line_lens, len)
        endif
        let i += 1
    endwhile

    return long_line_lens
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction








"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
"" Enable heavy features.
"" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
"" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
"
"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"       \ }
"
"" Define keyword.
"if !exists('g:neocomplcache_keyword_patterns')
"   let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplcache#smart_close_popup() . "\<CR>"
"     " For no inserting <CR> key.
"     return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"endfunction
"
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()
"
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"" Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
" let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
