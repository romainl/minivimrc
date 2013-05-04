minivimrc
=========

`minivimrc` is the smallest `.vimrc` I could come up with.

It contains only what *I* consider to be the most basic settings *I* need in order to make Vim comfortable. The whole thing could be condensed in a one liner, probably, but it’s clearer that way.

    filetype plugin indent on          " filetype detection and settings
    syntax on                          " syntax highlighting
    silent! runtime macros/matchit.vim " matchit comes with Vim
    set nocompatible                   " not strictly necessary but useful in some scenarii
    set backspace=indent,eol,start     " let the backspace key work "normally"
    set hidden                         " hide unsaved buffers
    set incsearch                      " incremental search rules
    set laststatus=2                   " not strictly necessary but good for consistency
    set ruler                          " shows line number in the status line
    set switchbuf=useopen,usetab       " better behavior for the quickfix window and :sb
    set tags=./tags;/,tags;/           " search tags files efficiently
    set wildmenu                       " better command line completion, shows a list of matches
    nnoremap gb :buffers<CR>:sb<Space> " quick buffer navigation
