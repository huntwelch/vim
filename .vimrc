filetype off

" Pathogen stuff. inorite?
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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

au! BufRead,BufNewFile *.jade setfiletype jade 
au! BufRead,BufNewFile *.styl setfiletype styl 
au! BufRead,BufNewFile *.coffee setfiletype coffee 

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2 syntax=coffee
autocmd Filetype styl setlocal ts=2 sts=2 sw=2 syntax=stylus
autocmd Filetype jade setlocal ts=2 sts=2 sw=2 syntax=jade

" Key mappings
" :let mapleader = ","
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

" Word mode
func! WordProcessorMode() 
  setlocal formatoptions=1 
  setlocal noexpandtab 
  map j gj 
  map k gk
  setlocal spell spelllang=en_us 
  set complete+=s
  set formatprg=par
  setlocal wrap 
  setlocal linebreak 
endfu 
com! WP call WordProcessorMode()

func! ExitWordMode() 
  setlocal formatoptions="tcq" 
  setlocal expandtab 
  map j j 
  map k k
  setlocal nospell
  set complete-=s
  set formatprg=""
  setlocal nowrap 
  setlocal nolinebreak 
endfu 
com! WQ call ExitWordMode()


call pathogen#infect() 
