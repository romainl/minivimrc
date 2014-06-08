""""""""""""""""
" MY MINIVIMRC "
""""""""""""""""

" because -u /path/to/minivimrc
set nocompatible

" filetype support
filetype plugin indent on
syntax on

" because % is addictive
runtime macros/matchit.vim

" various settings
set backspace=indent,eol,start
set foldmethod=indent
set hidden
set incsearch
set laststatus=2
set path=**
set ruler
set tags=./tags;,tags;
set wildcharm=<C-z>
set wildmenu

" juggling with files
nnoremap ,f :find *
nnoremap ,s :sfind *
nnoremap ,v :vert sfind *

" juggling with buffers
nnoremap ,b         :buffer <C-z><S-Tab>
nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>

" juggling with tags
nnoremap ,t :tjump /
nnoremap ,p :ptjump /

" juggling with errors
nnoremap <End>  :cnext<CR>zv
nnoremap <Home> :cprevious<CR>zv

" super quick search and replace
nnoremap ,r :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap ,R :%s/\<<C-r>=expand('<cword>')<CR>\>/

" completion
inoremap ,, <C-x><C-o>
inoremap ,/ <C-x><C-f>
inoremap ,- <C-x><C-l>
inoremap ,* <C-x><C-n>

" various adjustments of the default colorscheme
hi Visual       cterm=NONE ctermbg=white    ctermfg=darkblue
hi ModeMsg      cterm=NONE ctermbg=green    ctermfg=black
hi StatusLineNC cterm=bold ctermbg=darkgrey
