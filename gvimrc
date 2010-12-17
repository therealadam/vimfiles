" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

" set guifont=Meslo\ LG\ M\ DZ:h12            " Font family and font size.
set guifont=Inconsolata:h14
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set background=light              " Background.
set lines=60 columns=85          " Window dimensions.

" colorscheme github
colorscheme railscasts

" my workflow
function AKwide()
  set columns=170
endfunction

function AKnarrow()
  set columns=85
endfunction
