" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Initialize pathogen (vim-bundles)
call pathogen#runtime_append_all_bundles()

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
"map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  ""set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  filetype plugin on
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Enable OmniCompletion
  set omnifunc=syntaxcomplete#Complete
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

  autocmd BufWinLeave *.otl mkview
  autocmd BufWinEnter *.otl silent loadview
  "autocmd BufWinLeave *.otl write

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


" Added by myself
"set noexpandtabs

" Smart indenting, based on the typed code.
set smartindent 

" Soft word wrap
set formatoptions+=l
set lbr

" Tab spacing.
set tabstop=3 
set shiftwidth=3 " same
set softtabstop=3 " same

"set background=light
" highlight LineNr        guifg=#DDEEFF ctermfg=DarkGrey
" highlight VertSplit		ctermbg=Black ctermfg=White
" highlight Folded			ctermbg=Black ctermfg=DarkGrey
"call s:hibg("LineNr"    ,"#222222","DarkBlue",80)
"colorscheme vividchalk
"set enc=utf-8

" MiniBufExplore
" let g:miniBufExplMapWindowNavVim = 1 
" let g:miniBufExplMapWindowNavArrows = 1 
" let g:miniBufExplMapCTabSwitchBufs = 1 
" let g:miniBufExplModSelTarget = 1 

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview


" RagTag
let g:ragtag_global_maps = 1

" Command-T
nmap <silent> <Leader>T :CommandTFlush<CR>

" Write before :make
set autowrite

let g:bufExplorerFindActive = 1
let g:bufExplorerShowRelativePath = 1

let NERDTreeSortDirs = 1
let NERDTreeIgnore = ['\~$','\.o$','\.elf$','\.class$','\.aux$','\.fls$','\.out$','\.\d*\(gf\|pk\)$','\.tfm$','\.tmproj$']

let Tlist_Use_Right_Window=1
" Remap some keys
nmap <C-j> <C-]>
nmap <C-k> <C-t>

" map <F2> to toggle NERDTree window
nmap <silent> <S-F2> :NERDTree<CR>
nmap <silent> <F2> :NERDTreeToggle<CR>

" Toggle linenumbers
nmap <silent> <F3> :set nu!<CR>:echo "Line numbers: " . strpart("OffOn", 3* &nu,3)<CR>

" Toggle highlight search term
nmap <silent> <F4> :set hls!<CR>:echo "Search highlight: " . strpart("OffOn", 3* &hls,3)<CR>

" Toggle show invisibles
"nmap <silent> ti	:set list!<CR>:echo "Show invisibles: " . strpart("OffOn", 3* &list,3)<CR>

" Toggle softwrap
"nmap tw :set wrap!<CR>:echo "Softwrap: " . strpart("OffOn", 3* &wrap,3)<CR>
set linebreak
"set showbreak=\ \ \ 
"nmap tW :set linebreak!<CR>:echo "Break words: " . strpart("OffOn", 3* !&linebreak,3)<CR>

nmap <silent> <S-F3> :call ToggleFoldColumn()<CR>
function ToggleFoldColumn()
	if &foldcolumn==0
		set foldcolumn=1
	else
		set foldcolumn=0
	endif
	echo "Show folds: " . strpart("OffOn", 3* &foldcolumn,3)
endfunction

nmap <silent> <F5> :make<CR>

" let VCSCommandGitExec = '/opt/local/bin/git'

set foldmethod=marker

" Toggle Make and SCons
set makeprg=scons
"nmap <silent> t<F5> :call ToggleScons()<CR>
"function ToggleScons()
"	if &makeprg=='make'
"		set makeprg=scons
"		echo "SCons set as builder"
"	else
"		set makeprg=make
"		echo "Make set as builder"
"	endif
"endfunction
au BufNewFile,BufRead SCons* set filetype=scons

" CMake
au BufNewFile,BufRead *.cmake,CMakeLists.txt,*.cmake.in setf cmake
au BufNewFile,BufRead *.ctest,*.ctest.in setf cmake
au BufNewFile,BufRead *.cmake,CMakeLists.txt,*.cmake.in runtime! indent/cmake.vim

" TeX
au BufNewFile,BufRead *.tex,*.latex,*.ltx set efm=%E!\ LaTeX\ %trror:\ %m,
	\%E!\ %m,
	\%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#,
	\%+W%.%#\ at\ lines\ %l--%*\\d,
	\%WLaTeX\ %.%#Warning:\ %m,
	\%Cl.%l\ %m,
	\%+C\ \ %m.,
	\%+C%.%#-%.%#,
	\%+C%.%#[]%.%#,
	\%+C[]%.%#,
	\%+C%.%#%[{}\\]%.%#,
	\%+C<%.%#>%.%#,
	\%C\ \ %m,
	\%-GSee\ the\ LaTeX%m,
	\%-GType\ \ H\ <return>%m,
	\%-G\ ...%.%#,
	\%-G%.%#\ (C)\ %.%#,
	\%-G(see\ the\ transcript%.%#),
	\%-G\\s%#,
	\%+O(%f)%r,
	\%+P(%f%r,
	\%+P\ %\\=(%f%r,
	\%+P%*[^()](%f%r,
	\%+P[%\\d%[^()]%#(%f%r,
	\%+Q)%r,
	\%+Q%*[^()])%r,
	\%+Q[%\\d%*[^()])%r

" Adding quickfixsupport for java
autocmd BufRead *.java set makeprg=ant
autocmd BufRead *.java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

autocmd BufRead *.gnuplot set filetype=gnuplot
autocmd BufRead *.plot set filetype=gnuplot
autocmd BufRead *.m set filetype=octave

" CuTest, not perfected, doesn't list test yet...
set efm^=%n)\ Test%.%#:%f:%l:\ %m

" Terminal window title
set title

" Searching
set ignorecase
set smartcase

" Completing
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Background buffers
set hidden

let mapleader = ","

" Tab-complete menu
set wildmenu

" Spelling
if has("spell")
  " turn spelling off by default
  set nospell
  "set spelllang=sv
  set spelllang=en
  " toggle spelling with F4 key
  map <F6> :set spell!<CR>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
  " they were using white on white
  highlight PmenuSel ctermfg=black ctermbg=lightgray
  " limit it to just the top 10 items
  set sps=best,10                    
endif

function! Spellang()
	return strpart(&spelllang,2 * !&spell,2)
endfunction

" My own functions
" Datetimestamps
iab <expr> xds strftime("%Y-%m-%d")
iab <expr> xts strftime("%H.%M.%s")
iab <expr> xdts strftime("%Y-%m-%d %H.%M.%S")

" Format statusbar
" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %t file name
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %v ?
"   %P percentage through buffer
"   %) end of width specification
"set statusline=%<%.40f%m%r%h%w%=\ %((%{Spellang()})%)%(\ %{fugitive#statusline()}%)\ %y[%{&makeprg}]\ (%(%{&fileencoding},%)%{&ff},%{&ts},%{&fo},%{&textwidth})\ %6.(%l%),%-5.(%c%V%)\ [%P]
set statusline=%<%.40f%m%r%h%w%=\ %((%{Spellang()})%)%(\ %{fugitive#statusline()}%)\ %y\ (%(%{&fileencoding},%)%{&ff},%{&ts},%{&fo},%{&textwidth})\ %6.(%l%),%-5.(%c%V%)\ [%P]
set laststatus=2