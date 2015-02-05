""""""""""""""""
" MY MINIVIMRC "
""""""""""""""""

" because -u /path/to/minivimrc
set nocompatible

" filetype support
filetype plugin indent on
syntax on

" because it is there
runtime macros/matchit.vim

" various settings
set autoindent
set backspace=indent,eol,start
set foldmethod=indent
set hidden
set incsearch
set laststatus=2
set path=.,**
set ruler
set shiftround
set smarttab
set tags=./tags;,tags;
set wildcharm=<C-z>
set wildmenu

" various autocommands
augroup minivimrc
    autocmd!

    " automatic quickfix/location window
    autocmd QuickFixCmdPost grep\|make\|grepadd\|vimgrep\|vimgrepadd\|cscope\|cfile\|cgetfile\|caddfile\|helpgrep cwindow
    autocmd QuickFixCmdPost lgrep\|lmake\|lgrepadd\|lvimgrep\|lvimgrepadd\|lfile\|lgetfile\|laddfile lwindow
augroup END

" various adjustments of the default colorscheme
hi Visual       cterm=NONE ctermbg=white    ctermfg=darkblue
hi ModeMsg      cterm=NONE ctermbg=green    ctermfg=black
hi StatusLineNC cterm=bold ctermbg=darkgrey

" various commands
command! -nargs=1 Space execute "setlocal shiftwidth=" . <args> . " softtabstop=" . <args> . " expandtab" | set shiftwidth? softtabstop? expandtab?
command! -nargs=1 Tab   execute "setlocal shiftwidth=" . <args> . " softtabstop=" . <args> . " noexpandtab" | set shiftwidth? softtabstop? expandtab?

" juggling with files
nnoremap ,f :find *
nnoremap ,s :sfind *
nnoremap ,v :vert sfind *

" juggling with buffers
nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>
nnoremap gb         :ls<CR>:b <C-z><S-Tab>

" juggling with tags and definitions
nnoremap ,t :tjump /
nnoremap ,p :ptjump /
nnoremap ,d :dlist /
nnoremap [D [D:

" juggling with searches
nnoremap ,i :ilist /
nnoremap [I [I:

" juggling with changes
nnoremap ,; *``cgn
nnoremap ,, #``cgN

" juggling with errors
nnoremap <End>  :cnext<CR>
nnoremap <Home> :cprevious<CR>

" super quick search and replace
nnoremap <Space><Space> :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <Space>%       :%s/\<<C-r>=expand('<cword>')<CR>\>/

" smarter command-line
cnoremap <expr> <CR>    getcmdline() =~ '\v\C(^(dli\|il\|ps))\|#$' ? "\<CR>:" : "\<CR>"
cnoremap <expr> <Tab>   getcmdtype() == "/" ? "<CR>/<C-r>/" : getcmdtype() == "?" ? "<CR>?<C-r>/" : "<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() == "/" ? "<CR>?<C-r>/" : getcmdtype() == "?" ? "<CR>/<C-r>/" : "<S-Tab>"

" completion
inoremap ,, <C-x><C-o><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
inoremap ,; <C-n><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
inoremap ,: <C-x><C-f><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
inoremap ,= <C-x><C-l><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" brace yourself
inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O
