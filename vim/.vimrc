" Add modeline functionality -- it's disabled by default on some distros
set modeline

filetype plugin on

" Mapping from usenet.
imap jj <Esc>

" Per-filetype settings
autocmd FileType java		setlocal tw=78 cin foldmethod=marker
autocmd FileType c,cpp		setlocal tw=72 cindent noexpandtab
autocmd FileType python		setlocal autoindent expandtab sts=4 sw=4 tw=78
autocmd FileType haskell	setlocal tw=72 sw=2 sts=2 et
autocmd FileType tex		setlocal tw=72 sw=2 sts=2 ai et
autocmd FileType tex		so ~/.vim/latex-abbrevs.vim
" 'linebreak' won't work without 'nolist'
autocmd FileType creole		setlocal tw=0 fo=t wrap nolist linebreak
autocmd FileType creole		so ~/.vim/creole-abbrevs.vim
autocmd FileType mail		setlocal tw=72 fo=tql
autocmd FileType lua		setlocal sts=4 sw=4 ai et
autocmd FileType rust		setlocal cin
autocmd FileType sh		setlocal sts=4 sw=4 si et

" Custom filetypes per extension. Not sure this is the recommended way to do it.
autocmd BufRead,BufNewFile *.wiki setlocal ft=creole
autocmd BufRead,BufNewFile *.tex setlocal ft=tex
autocmd BufRead,BufNewFile *.cool setlocal ft=cool
autocmd BufRead,BufNewFile *.cl setlocal ft=cool
autocmd BufRead,BufNewFile *.miC setlocal ft=C
autocmd BufRead,BufNewFile *.g setlocal ft=antlr
autocmd BufRead,BufNewFile *.rkt setlocal ft=scheme
autocmd BufRead,BufNewFile SConstruct* setlocal ft=python tw=0
autocmd BufRead,BufNewFile SConscript* setlocal ft=python tw=0

set autowrite

set dir=/tmp

set nocompatible
"backspace configuration
set bs=2

"""""""""
"display"
"""""""""
"set number
"number of columns of the screen
"set columns=80
"use colors that look good on a dark background
set background=dark
"minimal number of screen lines to keep abave and below the cursor
set so=5
"briefly jump to the matching bracket
set showmatch
"time to show the match
set matchtime=2

""""""""""""""
"search stuff"
""""""""""""""
"incremental search
set incsearch
"matching text is highlighted
set hlsearch

"ignorecase in search patterns
set ignorecase
set smartcase
""/copyright      " Case insensitive
""/Copyright      " Case sensitive
""/copyright\C    " Case sensitive
""/Copyright\c    " Case insensitive

""""""""""""""
"status stuff"
""""""""""""""
"always have a status line
set laststatus=2
"show line and column number of the cursor position
set ruler
"show command in the last line of the screen
set showcmd
set wildmenu
"content of the status line
"file_name Line:row/nb_of_rows, col
set statusline=%<%f\  "filename
set statusline+=%w%h%m%r\  "options
set statusline+=line:%l\/%L,\ col:%c%V
"set statusline=%<%f\ %h%m%r%=%-14.(line:%l,col:%c%V%)\ %P

syntax on

""""""
"TODO"
""""""
"set nobackup
"set nowb
"set noswapfile
"set autoindent
"set smartindent

"""""""""""""""""""
"options disabled "
"""""""""""""""""""
"underline cursor line
"set cursorline

" More tabs -- we have enough memory.
set tabpagemax=20

" Mark tabs and spaces
"set list listchars=tab:»\ ,trail:·,extends:»,precedes:«

map Q gq

" Ripped off from Bee on vim_use mailing list
" Space as PageDown like web browser
nmap <Space> <PageDown>
vmap <Space> <PageDown>
" /ripoff

" Disable the background color erase; makes the text background the same as
" the terminal background
set t_ut=

" Open new vertical splits to the right of current one.
set splitright

set hidden

nnoremap <Tab> <C-W>w
nnoremap <F9> :cope<CR>
nnoremap <S-F9> :ccl<CR>

nnoremap <F1> 1gt
nnoremap <F2> 2gt
nnoremap <F3> 3gt
nnoremap <F4> 4gt

nnoremap <F5> :cp<CR>
nnoremap <F6> :cn<CR>

" Align subsequent lines to open parantheses in C sources.  Via andradaq.
set cinoptions=(0,W4

" Restore position inside previously opened file.  From vim.wikia.
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
