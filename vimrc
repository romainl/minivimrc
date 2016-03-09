" NANOVIMRC

" various settings
set autoindent
set backspace=indent,eol,start
set hidden
set incsearch
set path=.,**
set ruler
set shiftround
set smarttab
set wildmenu

" NANOVIMRC + ... = MICROVIMRC

" filetype support
filetype plugin indent on
syntax on

" because it's there
runtime macros/matchit.vim

" various adjustments of the default colorscheme
hi ModeMsg      cterm=NONE ctermbg=green    ctermfg=black
hi Search       cterm=NONE ctermbg=yellow   ctermfg=black
hi StatusLineNC cterm=bold ctermbg=darkgrey
hi Visual       cterm=NONE ctermbg=white    ctermfg=darkblue

" MICROVIMRC + ... = MINIVIMRC

" more various settings
set complete+=d
set foldlevelstart=999
set foldmethod=indent
set grepprg=grep\ -nrsH
set mouse=a
set noswapfile
set shiftwidth=0
let &softtabstop = &tabstop
set tags=./tags;,tags;
set wildcharm=<C-z>
set wildmode=full

" various autocommands
augroup minivimrc
	autocmd!
	" automatic location/quickfix window
	autocmd QuickFixCmdPost [^l]* cwindow
	autocmd QuickFixCmdPost    l* lwindow
augroup END

" commands for adjusting indentation rules manually
command! -nargs=1 Spaces execute "setlocal shiftwidth=" . <args> . " softtabstop=" . <args> . " expandtab" | set shiftwidth? softtabstop? expandtab?
command! -nargs=1 Tabs   execute "setlocal shiftwidth=" . <args> . " softtabstop=" . <args> . " noexpandtab" | set shiftwidth? softtabstop? expandtab?

" juggling with jumps
nnoremap ' `

" juggling with files
nnoremap ,f :find *
nnoremap ,s :sfind *
nnoremap ,v :vert sfind *
nnoremap ,t :tabfind *

" juggling with buffers
nnoremap ,b         :buffer *
nnoremap ,B         :sbuffer *
nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>
nnoremap <BS>       <C-^>

" juggling with tags and definitions
nnoremap ,j :tjump /
nnoremap ,p :ptjump /
nnoremap ,d :dlist /
nnoremap [D [D:djump   <C-r><C-w><S-Left><Left>
nnoremap ]D ]D:djump   <C-r><C-w><S-Left><Left>

" juggling with matches
nnoremap ,i :ilist /
nnoremap [I [I:ijump   <C-r><C-w><S-Left><Left><Left>
nnoremap ]I ]I:ijump   <C-r><C-w><S-Left><Left><Left>

" juggling with changes
nnoremap ,; *``cgn
nnoremap ,, #``cgN

" smooth greppin'
command! -nargs=+ -complete=file_in_path -bar Grep silent! grep! <args> | redraw!

" juggling with quickfix entries
nnoremap <End>  :cnext<CR>
nnoremap <Home> :cprevious<CR>

" super quick search and replace
nnoremap <Space><Space> :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <Space>%       :%s/\<<C-r>=expand("<cword>")<CR>\>/

" smarter command-line
cnoremap <expr> <Tab>   getcmdtype() == "/" \|\| getcmdtype() == "?" ? "<CR>/<C-r>/" : "<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() == "/" \|\| getcmdtype() == "?" ? "<CR>?<C-r>/" : "<S-Tab>"

" smoother listing
cnoremap <expr> <CR> <SID>CCR()

" better completion menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap ,, <C-n><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
inoremap ,: <C-x><C-f><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
inoremap ,= <C-x><C-l><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>

" brace expansion on the cheap
inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap {; {<CR>};<Esc>O
inoremap {, {<CR>},<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap [; [<CR>];<Esc>O
inoremap [, [<CR>],<Esc>O

" JavaScript
augroup JS
	autocmd!
	autocmd FileType javascript call <SID>JavaScriptSetup()
augroup END

" functions
function! s:JavaScriptSetup()
	setlocal include=^\\s*\\([^\/]\\{-\\}import[^'\"]*\\\|[^\/]\\{-\\}require\(\\)*['\"]\\zs[^'\"]*\\ze
	setlocal suffixesadd+=.js
	setlocal define=^\\s*\\(var\\\|let\\\|function\\\|define\\)[('\"]\\{-\\}
endfunction

function! s:CCR()
	if getcmdtype() == ":"
		let cmdline = getcmdline()
		    if cmdline =~ '\v\C^(dli|il)'  | return "\<CR>:" . cmdline[0] . "jump  " . split(cmdline, " ")[1] . "\<S-Left>\<Left>"
		elseif cmdline =~ '\v\C^(cli|lli)' | return "\<CR>:silent " . repeat(cmdline[0], 2) . "\<Space>"
		elseif cmdline =~ '\C^old' | return "\<CR>:edit #<"
		elseif cmdline =~ '\C^ls' | return "\<CR>:b"
		elseif cmdline =~ '/#$' | return "\<CR>:"
		else | return "\<CR>" | endif
	else | return "\<CR>" | endif
endfunction
