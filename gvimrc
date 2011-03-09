" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

" set guifont=Meslo\ LG\ M\ DZ:h12            " Font family and font size.
" set guifont=Inconsolata:h14
" set guifont=Bitstream\ Vera\ Sans\ Mono:h12
set guifont=Meslo\ LG\ M\ DZ:h13
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set background=light              " Background.
set lines=60 columns=85          " Window dimensions.

" colorscheme github
" colorscheme railscasts
" colorscheme vwilight
colorscheme tir_black

" my workflow
function AKwide()
  set columns=170
endfunction

function AKnarrow()
  set columns=85
endfunction

function AKchunky()
  set guifont=Meslo\ LG\ M\ DZ:h13
  set lines=80
endfunction

function AKskinny()
  set guifont=Meslo\ LG\ M\ DZ:h12
  set lines=65
endfunction

nnoremap <leader>akw :call AKwide()<CR>
nnoremap <leader>akn :call AKnarrow()<CR>
nnoremap <leader>akc :call AKchunky()<CR>
nnoremap <leader>aks :call AKskinny()<CR>

" I shall never forsake fullscreen editing
" set fuoptions=maxvert,maxhorz

nnoremap <leader>akm :set invfullscreen<CR>
