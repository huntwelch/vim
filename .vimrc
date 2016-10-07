filetype off

" Pathogen stuff. inorite?
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Basic settings
syntax on 
set nowrap
set ruler
set autoindent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set number

let g:solarized_termcolors = 256
colorscheme distinguished
set background=dark

:hi Comment ctermfg=black

" File type and styles
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

au! BufRead,BufNewFile *.jade setfiletype jade 
au! BufRead,BufNewFile *.styl setfiletype styl 
au! BufRead,BufNewFile *.less setfiletype less
au! BufRead,BufNewFile *.coffee setfiletype coffee 
au! BufRead,BufNewFile *.yaml setfiletype yaml
au! BufRead,BufNewFile *.less setfiletype less
au! BufRead,BufNewFile *.soy setfiletype html

autocmd Filetype c setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype less setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2 syntax=coffee
autocmd Filetype less setlocal ts=2 sts=2 sw=2 syntax=less
autocmd Filetype styl setlocal ts=2 sts=2 sw=2 syntax=stylus
autocmd Filetype jade setlocal ts=2 sts=2 sw=2 syntax=jade
" autocmd FileType c,cpp,java,php,python,ruby,eruby,yaml autocmd BufWritePre <buffer> :%s/\s\+$//e

au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim

let g:closetag_html_style=1 
let g:syntastic_auto_jump = 0

autocmd BufRead,BufNewFile *.soy set syntax=html 

filetype on 

" Key mappings
" :let mapleader = ","
map <C-n> :NERDTreeToggle<CR>
map <unique> <Leader>l <Plug>TaskList

nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>

nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>
let g:pep8_map='\8'

set incsearch
set smartcase
set hlsearch
nmap \q :nohlsearch<CR>
nmap \c iconsole.log();
nmap \[ "0p<CR>
nmap \p :reg<CR>
" nmap \s :SyntasticCheck<CR>
" ???
nmap \l <Plug>TaskList
nmap ; :CtrlPBuffer<CR>
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>
nmap \f zfat<CR>
nmap f za<CR>

cnoremap sudow w !sudo tee % >/dev/null

set viminfo='10,\"100,:20,%,n~/.viminfo
set runtimepath^=~/.vim/bundle/ctrlp.vim
set tags=./tags,tags;$HOME

au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

map <leader>cd :cd %:p:h<CR>

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
