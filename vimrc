""""""""""""""""
" MY MINIVIMRC "
""""""""""""""""

" because -u /path/to/minivimrc
set nocompatible

" filetype detection and syntax highlighting
filetype plugin indent on
syntax on

" it's there so let's activate it
runtime macros/matchit.vim

" various settings
set autoindent
set backspace=indent,eol,start
set completeopt+=longest,menuone
set foldmethod=indent
set hidden
set incsearch
set laststatus=2
set list
set listchars=tab:\ \ 
set path=.,**
set ruler
set shiftround
set smarttab
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
nnoremap <End>  :cnext<CR>
nnoremap <Home> :cprevious<CR>

" juggling with searches
nnoremap [I [I:
xnoremap [I "vy:<C-u>let cmd = 'ilist /' . @v<bar>call histadd("cmd", cmd)<bar>execute cmd<CR>:
nnoremap ,I :ilist /
nnoremap [D [D:
xnoremap [D "vy:<C-u>let cmd = 'dlist /' . @v<bar>call histadd("cmd", cmd)<bar>execute cmd<CR>:
nnoremap ,D :dlist /

" juggling with search/replace
nnoremap <Space><Space> :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <Space>%       :%s/\<<C-r>=expand('<cword>')<CR>\>/

" juggling with completion
inoremap ,, <C-x><C-o><Down><C-p><Down>
inoremap ,; <C-p><Down><C-p><Down>
inoremap ,: <C-x><C-f><Down><C-p><Down>
inoremap ,= <C-x><C-l><Down><C-p><Down>

" various adjustments of the default colorscheme
hi ModeMsg      cterm=NONE ctermbg=green    ctermfg=black
hi StatusLineNC cterm=bold ctermbg=darkgrey
hi Visual       cterm=NONE ctermbg=white    ctermfg=darkblue
