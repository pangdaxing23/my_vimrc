""""""""""""""""""""""""""""""""""""""""
"""""""" pangdaxing23's gvimrc """""""""
""""""""""""""""""""""""""""""""""""""""

set guifont=InputMono\ Light:h15

" InputMono is really close together for some reason
if &guifont =~ 'InputMono'
    set linespace=4
else
    set linespace=1
endif

set guioptions-=rlRL  "remove scroll bar

" or some other theme that supports italics
colorscheme solarized
call togglebg#map("")

" airline
" airline colorscheme
let g:airline_theme='solarized'

set background=dark "light/dark

