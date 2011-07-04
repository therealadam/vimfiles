" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

let mapleader = ","               " Easier leader

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set gdefault                      " Global search and replace by default

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=1                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile
set directory=.,$HOME/.vim/tmp/  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

set textwidth=80
set formatoptions=qrn1
set colorcolumn=80

" colorscheme vwilight
if has('gui_running')
  set background=light
else
  set t_Co=256
  set background=light
  colorscheme solarized
endif

" Uncomment to use Jamis Buck's file opening plugin
map <Leader>ft :FuzzyFinderTextMate<Enter>
map <Leader>fb :FuzzyFinderBuffer<Enter>

set foldenable
set foldcolumn=2
set foldmethod=marker
set foldlevelstart=1
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

" Automatic fold settings for specific files. Uncomment to use.
autocmd FileType ruby setlocal foldmethod=syntax
autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec
autocmd BufNewFile,BufRead *_test.rb compiler rubyunit
autocmd BufNewFile,BufRead test_*.rb compiler rubyunit

" Remap search for sanity
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set gdefault " replace globally by default
set showmatch

" Line wrapping for great good
set textwidth=79
set formatoptions=qrn1

" Show invisible characters ala TextMate
set list
set listchars=tab:▸\ ,eol:¬

" Strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader>a :Ack

" re-hardrap paragraphs of text
nnoremap <leader>q gqip

" Pop out the NERDTree
nnoremap <leader>nt :NERDTreeToggle<CR>

" Ruby bits
au BufRead,BufNewFile *.ru           set ft=ruby
au BufRead,BufNewFile *.god          set ft=ruby
au BufRead,BufNewFile *.rake         set ft=ruby
au BufRead,BufNewFile Rakefile       set ft=ruby
au BufRead,BufNewFile Capfile        set ft=ruby
au BufRead,BufNewFile Gemfile        set ft=ruby

" add homebrew to my path
let $PATH="/Users/adam/Develop/homebrew/bin:/Users/adam/Develop/homebrew/sbin:/Users/adam/Develop/cassandra/bin:/usr/local/mysql/bin:/Users/adam/Develop/dotfiles/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin"

" Tweak NERDTree
" let NERDTreeHijackNetrw=0
let NERDTreeQuitOnOpen=1

" TextMate-esque text bubbling
" Courtesy http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" -----
" Stealing from https://github.com/nelstrom/dotfiles/blob/master/vimrc

" Select the text that was last edited/pasted
nmap gV `[v`]

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

autocmd FileType html,css,scss setlocal ts=2 sts=2 sw=2 expandtab foldmethod=indent
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab foldmethod=indent
autocmd FileType markdown setlocal wrap linebreak nolist
autocmd BufNewFile,BufRead *.rss setfiletype xml foldtype=indent

".pml is automatically set to 'promela'. Override to use XML
" lifted from: https://github.com/tpope/vim-markdown/blob/34e28b3f6f6d702ff2963b8196eccae9344ed4bc/ftdetect/markdown.vim
autocmd BufNewFile,BufRead *.pml
      \ if &ft =~# '^\%(promela\)$' |
      \   set ft=xml |
      \ else |
      \   setf xml |
      \ endif

" Insert mode mappings
" emacs style jump to end of line
imap <C-e> <C-o>A
imap <C-a> <C-o>I

" Let's ctag, dude.
" Consider copping this: http://stackoverflow.com/questions/4539265/regenerate-ctags-in-vim-using-rvm
map <leader>ct :!ctags -R .<cr>

augroup filetypedetect 
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig 
augroup END 

au BufRead,BufNewFile *.thrift set filetype=thrift
" au! Syntax thrift source ~/.vim/thrift.vim

" The part where I cargo-cult from Gary Bernhardt
" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc

" Remap the tab key to do autocompletion or indentation depending on the
" " context (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\\k'
    return "\\<tab>"
  else
    return "\\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

function! RunTests(target, args)
  silent ! echo
  exec 'silent ! echo -e "\033[1;36mRunning tests in ' . a:target . '\033[0m"'
  silent w
  exec "make " . a:target . " " . a:args
endfunction

function! ClassToFilename(class_name)
  let understored_class_name = substitute(a:class_name, '\(.\)\(\u\)', '\1_\U\2', 'g')
  let file_name = substitute(understored_class_name, '\(\u\)', '\L\1', 'g')
  return file_name
endfunction

function! ModuleTestPath()
  let file_path = @%
  let components = split(file_path, '/')
  let path_without_extension = substitute(file_path, '\.py$', '', '')
  let test_path = 'tests/unit/' . path_without_extension
  return test_path
endfunction

function! NameOfCurrentClass()
  let save_cursor = getpos(".")
  normal $<cr>
  call PythonDec('class', -1)
  let line = getline('.')
  call setpos('.', save_cursor)
  let match_result = matchlist(line, ' *class \+\(\w\+\)')
  let class_name = ClassToFilename(match_result[1])
  return class_name
endfunction

function! TestFileForCurrentClass()
  let class_name = NameOfCurrentClass()
  let test_file_name = ModuleTestPath() . '/test_' . class_name . '.py'
  return test_file_name
endfunction

function! TestModuleForCurrentFile()
  let test_path = ModuleTestPath()
  let test_module = substitute(test_path, '/', '.', 'g')
  return test_module
endfunction

function! RunTestsForFile(args)
  if @% =~ 'test_'
    call RunTests('%', a:args)
  else
    let test_file_name = TestModuleForCurrentFile()
    call RunTests(test_file_name, a:args)
  endif
endfunction

function! RunAllTests(args)
  silent ! echo
  silent ! echo -e "\033[1;36mRunning all unit tests\033[0m"
  silent w
  exec "make!" . a:args
endfunction

function! JumpToError()
  if getqflist() != []
    for error in getqflist()
      if error['valid']
        break
      endif
    endfor
    let error_message = substitute(error['text'], '^ *', '', 'g')
    silent cc!
    exec ":sbuffer " . error['bufnr']
    call RedBar()
    echo error_message
  else
    call GreenBar()
    echo "All tests passed"
  endif
endfunction

function! RedBar()
  hi RedBar ctermfg=white ctermbg=red guibg=red
  echohl RedBar
  echon repeat(" ",&columns - 1)
  echohl
endfunction

function! GreenBar()
  hi GreenBar ctermfg=white ctermbg=green guibg=green
  echohl GreenBar
  echon repeat(" ",&columns - 1)
  echohl
endfunction

function! JumpToTestsForClass()
  exec 'e
endfunction

" Let's just give this a try...
set showtabline=2

" Copy to OS X pasteboard. Yays.
map <silent> <leader>y :<C-u>silent '<,'>w !pbcopy<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Running tests
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " vim-makegreen binds itself to ,t unless something else is bound to its
" " function.
map <leader>\dontstealmymapsmakegreen :w\|:call MakeGreen('spec')<cr>

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo
  if filereadable("script/test")
    exec ":!script/test " . a:filename
  else
    exec ":!bundle exec rspec " . a:filename
  end
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_spec_file = match(expand("%"), '_spec.rb$') != -1
  if in_spec_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction

map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('spec')<cr>
map <leader>c :w\|:!cucumber<cr>
map <leader>C :w\|:!cucumber --profile wip<cr>
