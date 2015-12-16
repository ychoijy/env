syntax on

set shiftwidth=4
set tabstop=4
set ignorecase
set ruler
set ai
set si
set hls
set incsearch
set mouse=a
set cindent
set cc=80
set cino=(0

colo darkocean

autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e
autocmd BufWritePre *.cpp :%s/\s\+$//e
autocmd BufWritePre *.java :%s/\s\+$//e
autocmd BufWritePre *.php :%s/\s\+$//e
autocmd BufWritePre *.ml :%s/\s\+$//e
autocmd BufWritePre *.mli :%s/\s\+$//e
autocmd BufReadPre *.c set shiftwidth=8 tabstop=8
autocmd BufReadPre *.h set shiftwidth=8 tabstop=8

let mapleader='\'

map <Tab> >gv
map <S-Tab> <gv
map <S-h> 0
map <S-l> $
map <F1> K
map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>
map <F4> :cs kill -1<CR>:!cd $WORKSPACE_HOME;cscope_build<CR>:cs add $WORKSPACE_HOME<CR>
map <F5> :!git add %<CR>
map <S-F5> :!git reset HEAD %<CR>
map <F6> :!git status<CR>
map <S-F6> :!git diff %<CR>
map <F7> :make<CR>
map <S-F7> :make clean<CR>
map <F8> :cs kill -1<CR>:!cd $WORKSPACE_HOME;make cscope ARCH=x86_64<CR>:cs add $WORKSPACE_HOME<CR>
map <S-F8> :cd /home/ychoijy/HMA/linux-3.12.24/<CR>:cs add cscope.out<CR>
map <F9> :noh<CR>
map <C-n><C-n> :set invnumber<CR>
map <C-k> <C-W>-
map <C-j> <C-W>+
map <C-h> <C-W><
map <C-l> <C-W>>

"---------------------------
" Taglist options
"---------------------------
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Show_One_File = 1

"---------------------------
" Easy grep options
"---------------------------
let EasyGrepMode=1
