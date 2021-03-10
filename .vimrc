"--------------------
" Common
"--------------------
set ruler		"show current location
set history=500
set number
"set relativenumber
"set clipboard=unnamedplus
"set paste		"disable auto indent under paste
set backspace=eol,start,indent	"backspace enable?"
set laststatus=2 	"turn on bottom bar
"set cursorline		"show cursor line
set mouse=a
set cc=80
set noswapfile
"set nobackup		"don't make the backup file
set visualbell
set updatetime=100	"vim's update time (default : 4000 = 4sec)

"--------------------
" Indent & width
"--------------------
"set expendtab		"tab -> space
set autoindent		"auto indent enable
set shiftwidth=8	"auto indent width
set cindent		"c language auto indent
set tabstop=8		"the number of space (\t print)
set softtabstop=8	"the number of space (tab)

"--------------------
" Smart setting
"--------------------
"set smartcase		"no automatic ignore case switch
set smarttab		"ts, sts, sw
set smartindent		"when autoindent, ignore #include and preprocess 

"--------------------
" Search & Highlight
"--------------------
if has("syntax")
	syntax on
endif
set ignorecase		" <-> set showcase
set hlsearch 		"search highlight 
set incsearch
set showmatch		"matching ( highlight

"--------------------
" WhiteSpace Setting
"--------------------
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:␣
highlight ExtraWhitespace ctermbg=yellow guibg=yellow
match ExtraWhitespace /\s\+$/

"--------------------
" etc...
"--------------------
set cino=(0


"--------------------
" Auto Commands (White Space auto remvoe)
"--------------------
autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e
autocmd BufWritePre *.cpp :%s/\s\+$//e
autocmd BufWritePre *.java :%s/\s\+$//e
autocmd BufWritePre *.php :%s/\s\+$//e
autocmd BufWritePre *.ml :%s/\s\+$//e
autocmd BufWritePre *.mli :%s/\s\+$//e
autocmd BufReadPre *.c set shiftwidth=8 tabstop=8
autocmd BufReadPre *.h set shiftwidth=8 tabstop=8

"============================================================
" Key Mapping
"============================================================
let mapleader=','

map <Tab> >gv
map <S-Tab> <gv
map <S-h> 0
map <S-l> $

map <F1> K
map <F2> :NERDTreeToggle<CR>
"map <F3> :TlistToggle<CR>
map <F3> :TagbarToggle<CR>
map <F4> :GitGutterToggle<CR>

map <F5> :!git add %<CR>
map <S-F5> :!git reset HEAD %<CR>
map <F6> :!git status<CR>
map <S-F6> :!git diff %<CR>
map <F7> :source %<CR>:PluginInstall<CR>
map <F8> :source %<CR>:PluginClean<CR>
map <F9> :cs kill -1<CR>:!cd $WORKSPACE_HOME;make cscope ARCH=arm64<CR>:cs add $WORKSPACE_HOME<CR>
map <F10> :cs kill -1<CR>:!cd $WORKSPACE_HOME;cscope_build<CR>:cs add $WORKSPACE_HOME<CR>

map <C-n><C-n> :set invnumber<CR>
map <C-l><C-l> :set invlist<CR>
map <C-k> <C-W>-
map <C-j> <C-W>+
map <C-h> <C-W><
map <C-l> <C-W>>


"==============================================================
" Plugin Manager Setup Section
"==============================================================
"---------------------------
" Plugin Manager (Vundle)
"---------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'chase/focuspoint-vim'		"Color Skim
	Plugin 'morhetz/gruvbox'
	Plugin 'a.vim'				"Alternate Files quickley(.c->.h)
	Plugin 'tpope/vim-fugitive'		"git wrapper
	Plugin 'scrooloose/nerdtree'		"A tree explorer
	Plugin 'scrooloose/nerdcommenter'	"Commening powers
	Plugin 'scrooloose/syntastic'		"Syntax checking hacks
	Plugin 'airblade/vim-gitgutter'		"show git diff markers
	Plugin 'vim-airline/vim-airline'	"status bar
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'majutsushi/tagbar'		"tagbar (e.g. taglist)
	"Plugin 'taglist.vim
	Plugin 'chazy/cscope_maps'		"cscope key mapping
	Plugin 'blueyed/vim-diminactive'	"dim inactive windows
	Plugin 'MultipleSearch'			" :Search <pattern>, :SearchReset
	Plugin 'kien/ctrlp.vim'
call vundle#end()
filetype plugin indent on
"---------------------------
" color skim setup
"---------------------------
"set term=xterm-256color
"set t_Co=256
syntax enable
set background=dark
"colorscheme focuspoint
colorscheme gruvbox
"Comment color setting
hi Comment term=bold cterm=bold ctermfg=51

"---------------------------
" NERD Tree options
"---------------------------
let g:NERDTreeWinPos = "left"

"---------------------------
" Taglist options
"---------------------------
let Tlist_GainFoucs_On_ToggleOpen = 1
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1

"---------------------------
" Tagbar options
"---------------------------
let g:tagbar_width=40

"---------------------------
" Syntastic Setting
"---------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
let g:syntastic_c_compiler_options = "-std=c11 -Wall -Wextra -Wpedantic"

"----------------------------
" for vim-airline
"----------------------------
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>

"----------------------------
" NERD Commenter
"---------------------------
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"--------------------------
" for indent guide
"--------------------------
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

"--------------------------
" for blueyed/vim-dim inactive
"--------------------------
let g:diminactive_enable_focus = 1
