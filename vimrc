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
set path=.,**
set ruler
set tags=./tags;,tags;
set wildmenu

" juggling with files
nnoremap ,f :find *
nnoremap ,s :sfind *
nnoremap ,v :vert sfind *

" juggling with buffers
nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>
nnoremap gb         :ls<CR>:buffer<Space>

" juggling with tags
nnoremap ,t :tjump /
nnoremap ,p :ptjump /

" juggling with errors
nnoremap <End>  :cnext<CR>zv
nnoremap <Home> :cprevious<CR>zv

" juggling with searches
nnoremap [I [I:
nnoremap ,I :ilist /
nnoremap [D [D:
nnoremap ,D :dlist /

" super quick search and replace
nnoremap ,r :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap ,R :%s/\<<C-r>=expand('<cword>')<CR>\>/

" completion
inoremap ,, <C-x><C-o><Down><C-p><Down>
inoremap ,; <C-p><Down><C-p><Down>
inoremap ,: <C-x><C-f><Down><C-p><Down>
inoremap ,= <C-x><C-l><Down><C-p><Down>

" various adjustments of the default colorscheme
hi Visual       cterm=NONE ctermbg=white    ctermfg=darkblue
hi ModeMsg      cterm=NONE ctermbg=green    ctermfg=black
hi StatusLineNC cterm=bold ctermbg=darkgrey
