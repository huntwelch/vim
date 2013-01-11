filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype on 
syntax on
set nowrap
set ruler
set autoindent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set number
colorscheme wombat

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2

call pathogen#infect() 
