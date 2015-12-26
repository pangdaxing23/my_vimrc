call plug#begin('~/.vim/bundle')
Plug 'altercation/vim-colors-solarized' "solarized color scheme
call plug#end()

set guifont=InputMono\ Light:h16

" InputMono is really close together for some reason
if &guifont =~ 'InputMono'
    set linespace=4
else
    set linespace=1
endif

" or some other theme that supports italics
colorscheme solarized
call togglebg#map("")

" airline
" airline colorscheme
let g:airline_theme='solarized'

set background=light "light/dark
