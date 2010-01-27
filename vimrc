call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles'))

set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

" Explicitly set 256 color support
set t_Co=256

" Enable filetype-specific indenting and plugins
filetype plugin indent on

" Syntax Highlighting on
set nocompatible
syntax on

" Disable bell.
set vb t_vb=

" line numbers
set number
set numberwidth=3

" Open new horizontal split windows below current
set splitbelow

" Open new vertical split windows to the right
set splitright   

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" don't wrap lines that are too long
set nowrap

