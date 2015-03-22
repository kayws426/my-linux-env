set guifont=Bitstream\ Vera\ Sans\ Mono
"set guifont=consolas
set nu
set cindent

set nocp

filetype on
filetype indent on
filetype plugin on
syntax on
"del: color ron
set sm
set ruler
set history=1000
set backspace=indent,eol,start
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set cmdheight=2
set ignorecase
set incsearch
set hlsearch
set fencs=ucs-bom,utf-8,euc-kr.latin1
"del: set enc=euc-kr
set iminsert=0
set imsearch=0
set noea

" Omnicompletion
au FileType ruby,eruby set omnifunc=rubycomplete#Complete et si
au FileType ruby,eruby let g:rubycomplete_rails = 1

" Indent settings

set ts=4
set sw=4
set sts=4

" Compiler setting
au FileType c set makeprg=gcc\ %
au FileType cpp set makeprg=g++\ %
au FileType java set makeprg=java\ %
au FileType ruby set makeprg=ruby\ -wc\ %

map <F2> :w<cr>
map <F3> <c-w>w
map <F4> :res<cr>
map <F5> :w<cr> :make %<cr> :cope<cr>
map <F6> :WMToggl<cr> :Tlist<cr>
map <F7> :cp<cr>
map <F8> :cn<cr>
map <F9> :q<cr>
map <c-w><c-e> :q<cr>
map <c-w><q> :q<cr>

map <c-w><c-w> :WMToggle<cr>
map <c-w><c-t> :Tlist<cr>
map <c-w><c-p> :TlistSessionSave tlist<cr>
map <c-w><c-u> :TlistSessionLoad tlist<cr>
map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>

" changing window size when splitted
map <c-j> <C-W>-
map <c-k> <C-W>+
imap <c-j> <esc><C-W>-i
imap <c-k> <esc><C-W>+i

" copy and paste
map <c-a> <esc> :0<cr>vG$

botright cwindow

" showmarks settings
let showmarks_enable = 0

" Taglist settings
let Tlist_Process_File_Always = 0
let Tlist_Enable_Fold_Column = 0
let Tlist_Display_Tag_Scope = 0
let Tlist_Sort_Type = "name"
let Tlist_Use_Right_Window = 1
let Tlist_Display_Prototype = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0

let winManagerWindowLayout = 'FileExplorer|BufExplorer'

" Automatic folding
au BufWinLeave *.rb mkview
au BufWinEnter *.rb silent loadview

au BufWinLeave *.c mkview
au BufWinEnter *.c silent loadview

au BufWinLeave *.cpp mkview
au BufWinEnter *.cpp silent loadview

au BufWinLeave *.C mkview
au BufWinEnter *.C silent loadview

au BufWinLeave *.h mkview
au BufWinEnter *.h silent loadview

au BufWinLeave *.H mkview
au BufWinEnter *.H silent loadview

au BufWinLeave *.hpp mkview
au BufWinEnter *.hpp silent loadview
au BufWinEnter *.hpp set syntax=cpp

au BufWinLeave *.nc mkview
au BufWinEnter *.nc silent loadview

" C++ man page
au FileType c,cpp noremap K :exec '!man std::' . expand ("<cword>")<CR>
au FileType ruby noremap K :exec '!ri ' . expand("<cword>")<CR>
