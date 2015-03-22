"cd $HOME
"========= default variables setting =========
set cindent
set smartindent
set autoindent
"set nowrap
"set ff=unix
"set bg=dark
set ruler
set number
set modifiable
set hlsearch
set ts=4
set sw=4
set sts=4
set mouse=a
set formatoptions+=ro
"set backupdir=./.backup,.,/tmp
"set directory=.,./.backup,/tmp
set incsearch
set ignorecase
set printoptions=portrait:n,wrap:n,duplex:off
set noeol
set mouse=a
"set binary

"set isfname=@,48-57,/,\,.,-,_,+,,,#,$,%,{,},[,],:,@-@,!,~,=
"set isfname=@,48-57,/,\,.,-,_,+,,,#,$,%,{,},[,],:,@-@,!,~

set background=light
syntax enable
set backup
set backupdir=$HOME/.vim/backup
set viewdir=$HOME/.vim/view
set directory=$HOME/.vim/tmp
if isdirectory(&backupdir) == 0
	call mkdir(&backupdir, 'p', 0700)
endif
if isdirectory(&viewdir) == 0
	call mkdir(&viewdir, 'p', 0700)
endif
if isdirectory(&directory) == 0
	call mkdir(&directory, 'p', 0700)
endif
set cmdheight=1
set laststatus=2
set fencs=ucs-bom,utf-8,euc-kr.latin1
set backspace=indent,eol,start

" GUI options
"set guifont=Bitstream\ Vera\ Sans\ Mono
"set guifont=DejaVu\ Sans\ Mono\ 10
set gfn=Consolas:h9:cANSI
set pfn=Courier_New:h10
"width of the display
"set co=120
"number of lines in the display
"set lines=50





"========= vundle setting =========
set nocompatible               " be iMproved
filetype off                   " required!

""set rtp+=~/.vim/bundle/vundle/
""call vundle#rc()
"
"" let Vundle manage Vundle
"" required! 
"Bundle 'gmarik/vundle'
"
"" vim-scripts repos
"Bundle 'snipMate'
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'The-NERD-tree'
"Bundle 'taglist.vim'
"Bundle 'bufexplorer.zip'
""Bundle 'DirDiff.vim'
"
"Bundle 'Trinity'
"Bundle 'SrcExpl'
"
"Bundle 'bugfixes-to-vim-indent-for-verilog'
"Bundle 'automatic-for-Verilog'
"Bundle 'hdl_plugin'
"Bundle 'signal_dec_VHDL'
""Bundle 'session.vim'
"Bundle 'Source-Explorer-srcexpl.vim'
"Bundle 'Solarized'
"Bundle 'vim-orgmode'
"Bundle 'vim-task-org'
"Bundle 'code2html'
"Bundle 'minibufexplorerpp'
"Bundle 'neocomplcache'
"
"filetype plugin indent on     " required!
""
"" Brief help
"" :BundleList          - list configured bundles
"" :BundleInstall(!)    - install(update) bundles
"" :BundleSearch(!) foo - search(or refresh cache first) for foo
"" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
""
"" see :h vundle for more details or wiki for FAQ
"" NOTE: comments after Bundle command are not allowed..
"
let NERDTreeWinPos='right'

"========= key mapping ==========

map <F2> [{v%zf
map <F3> zo

map <F4> :Tlist<cr><C-W><C-W>
map <F5> :NERDTreeToggle<CR> 

map <F7> :cp<cr>
map <F8> :cn<cr>

map <F9> :BufExplorer<cr>

map <PageUp> <C-U><C-U>
map <PageDown> <C-D><C-D>

nmap <C-Left> <C-W><<C-W><<C-W><<C-W><
nmap <S-Left> <C-W><

nmap <C-Right> <C-W>><C-W>><C-W>><C-W>>
nmap <S-Right> <C-W>>
nmap <A-Right> <C-W>\|

nmap <C-Up> <C-W>+<C-W>+<C-W>+<C-W>+
nmap <S-Up> <C-W>+
nmap <A-Up> <C-W>_

nmap <C-Down> <C-W>-<C-W>-<C-W>-<C-W>-
nmap <S-Down> <C-W>-

nmap <C-H> <C-W>h 
nmap <C-J> <C-W>j 
nmap <C-K> <C-W>k 
nmap <C-L> <C-W>l 

map ,q :q<CR>	    " Close Current File
map ,. :cd %/..<CR>	    " change directory to current file located
"========= switch between file buffers ========
map ,x :bn!<CR>	  " Switch to Next File Buffer
map ,z :bp!<CR>	  " Switch to Previous File Buffer
map ,w :bw<CR>	  " Close Current File Buffer

map ,1 :b!1<CR>	  " Switch to File Buffer #1
map ,2 :b!2<CR>	  " Switch to File Buffer #2
map ,3 :b!3<CR>	  " Switch to File Buffer #3
map ,4 :b!4<CR>	  " Switch to File Buffer #4
map ,5 :b!5<CR>	  " Switch to File Buffer #5
map ,6 :b!6<CR>	  " Switch to File Buffer #6
map ,7 :b!7<CR>	  " Switch to File Buffer #7
map ,8 :b!8<CR>	  " Switch to File Buffer #8
map ,9 :b!9<CR>	  " Switch to File Buffer #9
map ,0 :b!0<CR>	  " Switch to File Buffer #0


"========= ctags setting ========
"Upon vim open a file buffer, CWD is switched to the position of the current
"file
"autocmd BufEnter * silent! lcd %:p:h:gs/ /\\/

set tags=./tags;/.

if filereadable("cscope.out")
	set nocsverb
	cs add cscope.out
	set csverb
endif

if version >= 500

func! Sts()
	let st = expand("<cword>")
	exe "sts ".st
endfunc
nmap ,st :call Sts()<cr>

func! Tj()
	let st = expand("<cword>")
	exe "tj ".st
endfunc
nmap ,tj :call Tj()<cr>

func! Tn()
	exe "tn"
endfunc
nmap ,tn :call Tn()<cr>

func! Tp()
	exe "tp"
endfunc
nmap ,tp :call Tp()<cr>

func! Tr()
	exe "tr"
endfunc
nmap ,tr :call Tr()<cr>

func! Tl()
	exe "tl"
endfunc
nmap ,tl :call Tl()<cr>

endif

"======== cscope setting ========
set csprg=/usr/bin/cscope
set csto=0
set cst

func! Csw()
	exe "cs show"
endfunc
nmap ,csw :call Csw()<cr>

func! Csc()
	let csc = expand("<cword>")
	new
	exe "cs find c ".csc
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,csc :call Csc()<cr>

func! Csd()
	let csd = expand("<cword>")
	new
	exe "cs find d ".csd
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,csd :call Csd()<cr>

func! Cse()
	let cse = expand("<cword>")
	new
	exe "cs find e ".cse
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,cse :call Cse()<cr>

func! Csf()
	let csf = expand("<cword>")
	new
	exe "cs find f ".csf
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,csf :call Csf()<cr>

func! Csg()
	let csg = expand("<cword>")
	new
	exe "cs find g ".csg
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,csg :call Csg()<cr>

func! Csi()
	let csi = expand("<cword>")
	new
	exe "cs find i ".csi
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,csi :call Csi()<cr>

func! Css()
	let css = expand("<cword>")
	new
	exe "cs find s ".css
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,css :call Css()<cr>

func! Cst()
	let cst = expand("<cword>")
	new
	exe "cs find t ".cst
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,cst :call Cst()<cr>


"============ man page setting =============
func! Man()
	let sm = expand("<cword>")
	exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
endfunc
nmap ,ma :call Man()<cr><cr>

"============ make setting =============
let startdir = getcwd()
func! Make()
	exe "!cd ".startdir
	exe "make"
endfunc
nmap ,mk :call Make()<cr><cr>

"============ hexViewer setting =============
let b:hexViewer = 0
let b:hexViewer_ft_backup = ""
func! Hv()
    "if (b:hexViewer == 0)
    if (&ft != "xxd")
        let b:hexViewer = 1
		let b:hexViewer_ft_backup = &ft "b:current_syntax
		exe "set binary"
        exe "%!xxd -g1 -c16"
		exe "set ft=xxd"
    else
        let b:hexViewer = 0
		exe "set nobinary"
        exe "%!xxd -g1 -c16 -r"
		exe "set ft=" . b:hexViewer_ft_backup
    endif
endfunc
nmap ,h :call Hv()<cr>

"============ file buffer CleanClose =============
func! CleanClose(tosave)
if (a:tosave == 1)
	w!
endif
let todelbufNr = bufnr("%")
let newbufNr = bufnr("#")
if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
	exe "b".newbufNr
else
	bnext
endif

if (bufnr("%") == todelbufNr)
	new
endif
	exe "bd".todelbufNr
endfunc

nmap ,cf :call CleanClose(0)<cr>

"============ open CWD =============
nmap ,od :e ./<cr>


"============ project specific settings =============
if filereadable(".project.vimrc")
	source .project.vimrc
endif


" lazy method of appending this onto your .vimrc ":w! >> ~/.vimrc"
" ------------------------------------------------------------------
" this block of commands has been autogenerated by solarized.vim and
" includes the current, non-default Solarized option values.
" To use, place these commands in your .vimrc file (replacing any
" existing colorscheme commands). See also ":help solarized"

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
"syntax enable
"set background=light
"colorscheme solarized
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=0
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_termcolors=16
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
" let g:solarized_diffmode="normal"
" let g:solarized_hitrail=0
" let g:solarized_menu=1
