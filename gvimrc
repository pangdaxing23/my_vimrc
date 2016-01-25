""""""""""""""""""""""""""""""""""""""""
"""""""" pangdaxing23's gvimrc """""""""
""""""""""""""""""""""""""""""""""""""""

set guifont=InputMono\ Light:h14

" InputMono is really close together for some reason
if &guifont =~ 'InputMono'
    set linespace=4
else
    set linespace=1
endif

set guioptions-=r  "remove right scroll bar
" set guioptions-=l  "remove scroll bar
" set guioptions-=R  "remove scroll bar
set guioptions-=L  "remove scroll bar

" or some other theme that supports italics
colorscheme solarized

call togglebg#map("")

" airline
" airline colorscheme
let g:airline_theme='solarized'
let g:airline_theme='base16'

set background=dark "light/dark
