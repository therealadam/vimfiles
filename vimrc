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
set directory=.,$HOME/.vim/tmp/  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%{SyntasticStatuslineFlag()}%=%-16(\ %l,%c-%v\ %)%P

colorscheme vwilight

" Uncomment to use Jamis Buck's file opening plugin
map <Leader>ft :FuzzyFinderTextMate<Enter>
map <Leader>fb :FuzzyFinderBuffer<Enter>

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
" set colorcolumn=85

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
let $PATH="/Users/adam/dev/homebrew/bin:/Users/adam/dev/homebrew/sbin:/Users/adam/dev/cassandra/bin:/usr/local/mysql/bin:/Users/adam/dev/dotfiles/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin"

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

autocmd FileType html,css,scss setlocal ts=2 sts=2 sw=2 expandtab foldtype=syntax
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab foldtype=syntax
autocmd FileType markdown setlocal wrap linebreak nolist
autocmd BufNewFile,BufRead *.rss setfiletype xml foldtype=syntax

".pml is automatically set to 'promela'. Override to use XML
" lifted from: https://github.com/tpope/vim-markdown/blob/34e28b3f6f6d702ff2963b8196eccae9344ed4bc/ftdetect/markdown.vim
autocmd BufNewFile,BufRead *.pml
      \ if &ft =~# '^\%(promela\)$' |
      \   set ft=xml |
      \ else |
      \   setf xml |
      \ endif

" Speed up buffer switching
map <C-k> <C-W>k
map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-l> <C-W>l

" Insert mode mappings
" emacs style jump to end of line
imap <C-e> <C-o>A
imap <C-a> <C-o>I

" Let's ctag, dude.
" Consider copping this: http://stackoverflow.com/questions/4539265/regenerate-ctags-in-vim-using-rvm
map <leader>ct :!ctags -R .<cr>
