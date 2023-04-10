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
set wildmenu
set wildmode=longest,list,full
set undofile		" keep an undo file (undo changes after closing)
"set binary

"set isfname=@,48-57,/,\,.,-,_,+,,,#,$,%,{,},[,],:,@-@,!,~,=
"set isfname=@,48-57,/,\,.,-,_,+,,,#,$,%,{,},[,],:,@-@,!,~

syntax on
set backup
set backupdir=$HOME/.vim/backup
set viewdir=$HOME/.vim/view
set directory=$HOME/.vim/tmp
set undodir=$HOME/.vim/undo
if isdirectory(&backupdir) == 0
	call mkdir(&backupdir, 'p', 0700)
endif
if isdirectory(&viewdir) == 0
	call mkdir(&viewdir, 'p', 0700)
endif
if isdirectory(&directory) == 0
	call mkdir(&directory, 'p', 0700)
endif
if isdirectory(&undodir) == 0
	call mkdir(&undodir, 'p', 0700)
endif
set cmdheight=1
set laststatus=2
set fencs=ucs-bom,utf-8,euc-kr,latin1
set backspace=indent,eol,start

if &t_Co > 2 || has("gui_running")
	" GUI options
	"set pfn=Courier_New:h10
	"set guifont=DejaVu\ Sans\ Mono\ 10
	"set gfn=Consolas:h9:cANSI
	set gfn=Consolas_for_Powerline_FixedD:h9:cANSI

	if &gfn != ""
		"width of the display
		set co=120
		"number of lines in the display
		set lines=50

		"source $VIMRUNTIME/vimrc_example.vim
		source $VIMRUNTIME/mswin.vim
		behave mswin
	else
		set background=light
	endif
endif


if &ft == "python"
	set efm=\ \ File\ \"%f\"\\,\ line\ %l\\,\ %m
endif

au BufNewFile,BufRead *.py  
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |

"========= vundle setting =========
set nocompatible               " be iMproved, required
filetype off                   " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim-scripts repos
Plugin 'snipMate'
Plugin 'L9'
Plugin 'FuzzyFinder'
"Plugin 'The-NERD-tree'
"Plugin 'taglist.vim'
Plugin 'bufexplorer.zip'
"Plugin 'DirDiff.vim'

Plugin 'Trinity'
Plugin 'SrcExpl'

"Plugin 'bugfixes-to-vim-indent-for-verilog'
"Plugin 'automatic-for-Verilog'
"Plugin 'hdl_plugin'
"Plugin 'signal_dec_VHDL'
"Plugin 'session.vim'
"Plugin 'Source-Explorer-srcexpl.vim'
"Plugin 'Solarized'
"Bundle 'vim-orgmode'
Plugin 'vim-task-org'
"Plugin 'code2html'
Plugin 'minibufexplorerpp'
Plugin 'neocomplcache'
Plugin 'indentpython'
Plugin 'python.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'neomake/neomake'

Plugin 'tpope/vim-surround'
Plugin 'sheerun/vim-polyglot'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'junegunn/fzf'

Plugin 'editsrec'
Plugin 'srecord.vim'
Plugin 'srec.vim'

Plugin 'multisearch.vim'

"Plugin 'JuliaEditorSupport/julia-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let NERDTreeWinPos='right'

"========= key mapping ==========

"map <F2> [{v%zf
map <F2> v]}zf
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

func! Toggle_wrap()
	set wrap!
	if &wrap != 0
		set guioptions-=b
	else
		set guioptions+=b
	endif
endfunc
nmap ,r :call Toggle_wrap()<cr>

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
        exe "%!xxd -r"
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


"========= open new tab ============
nmap ,t :tabnew<cr>


"============ project specific settings =============
if filereadable(".project.vimrc")
	source .project.vimrc
endif


"========= Solarized setting =========
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


"TOPIC: Toggling Comment (via functions) {{{2
"----------------------------------------
"FUNCTIONS: for toggle comments {{{3
"FUCNTION: set comment's prefix character based on filetype
"-----------------------------------------------------------
function! SetCommentPrefix()
    let s:comment_prefix = "#"
    if &filetype == "vim"
        " for vim, inline comment start with \"
        let s:comment_prefix = "\""
    elseif &filetype ==? "c" || &filetype ==? "objc" || &filetype ==? "cpp"
        let s:comment_prefix = "//"
    elseif &filetype ==? "python"
        let s:comment_prefix = "#"
    elseif &filetype ==? "go"
        let s:comment_prefix = "//"
    endif
endfunction

"FUCNTION: Make given line into Comment
"----------------------------------------
function! CommentLine(line_number)
    call SetCommentPrefix()
    " remember current cursor position
    let cpos = getpos(".")
    " move to seletced line
    call setpos(".", [0, a:line_number, 0, 0])
    " just insert comment prefix character at the front of given line
    exec "normal! I".s:comment_prefix
     "restore cursor position
    call setpos(".", cpos)
endfunction

"FUNCTION: Uncomment given line
"-------------------------------
function! UncommentLine(line_number)
    call SetCommentPrefix()
    " remember current cursor position
    let cpos = getpos(".")
    "move to selected line
    call setpos(".", [0, a:line_number, 0, 0])
    " remove comment prefix charactor
    " !!! use escape() for some languages's prefix eg. C=> "//"
    exec ".s/".escape(s:comment_prefix, s:comment_prefix[0])."//"
    " restore cursor position
    call setpos(".", cpos)
endfunction


"FUNCTION: Check given line number if the line is comment
"---------------------------------------------------------
"ARGS: line_number
"RETURN: 1: the line is comment, 0: the line is not comment
"-----------------------------------------------------------
function! CheckIsComment(line_number)
    call SetCommentPrefix()
    " check the line for given line number is comment
    let sl = getline(a:line_number)
    let c = 0
    while c < strlen(sl)
        let d = c + strlen(s:comment_prefix) - 1
        " sl[c] is space or tabe?
        if  " \t" =~ sl[c]
            " ignore indentation
            " pass
        elseif sl[(c):(d)] == s:comment_prefix
            return 1
        else
            return 0
        endif
        let c += 1
    endwhile
    return 0
endfunction

"FUNCTION: Toogle line comment
"------------------------------
function! ToggleCommentLine()
    "call SetCommentPrefix()
    let cl = line(".")
    if CheckIsComment(cl)
        call UncommentLine(cl)
    else
        call CommentLine(cl)
    endif
endfunction


"FUNCTION: Toggle Range comment
"-------------------------------
function! ToggleCommentRange()
    call SetCommentPrefix()
    let line_begin = line("'<")
    let line_end = line("'>")
    " decide mode with first line in selection
    let mode_ = CheckIsComment(line_begin)
    let cpos = getpos(".")
    let i = line_begin
    while i < line_end + 1
        if mode_
            call UncommentLine(i)
        else
            call CommentLine(i)
        endif
        let i+=1
    endwhile
endfunction

"MAPPING: maps for comment toggling
"-----------------------------------
nnoremap <leader>0 :call ToggleCommentLine()<cr>
nnoremap <leader>\ :call ToggleCommentLine()<cr>
vnoremap <leader>0 <esc> :call ToggleCommentRange()<cr>
vnoremap <leader>\ <esc> :call ToggleCommentRange()<cr>
nnoremap <c-/> :call ToggleCommentLine()<cr>
nnoremap <c-;> :call ToggleCommentLine()<cr>
vnoremap <c-/> <esc> :call ToggleCommentRange()<cr>

map ,/ :call ToggleCommentLine()<cr>
vmap <c-/> <esc> :call ToggleCommentRange()<cr>
