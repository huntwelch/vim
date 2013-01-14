filetype off

" Pathogen stuff. inorite?
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect() 

" Basic settings
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

" File type and styles
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

au! BufRead,BufNewFile *.coffee setfiletype coffee 
au! BufRead,BufNewFile *.styl setfiletype styl 

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype styl setlocal ts=2 sts=2 sw=2

" Key mappings
:let mapleader = ","
map <unique> <Leader>l <Plug>TaskList
nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>
let g:pep8_map='<leader>8'

" Memory
set viminfo='10,\"100,:20,%,n~/.viminfo

au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Reset cursor to last known position
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


