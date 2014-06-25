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

let mapleader = ","
let maplocalleader = ";"

" Makes plugins look smoother
set lazyredraw

" Initialize pathogen (vim-bundles)
call pathogen#infect()

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

"colorscheme mustang
" Statusbar filename
"hi User1 	guifg=#b1d631 guibg=#444444 gui=none ctermfg=253 ctermbg=238 cterm=none
" Statusbar warning
"hi User2 	guifg=#ca1850 guibg=#444444 gui=none ctermfg=208 ctermbg=238 cterm=none

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	" Enable file type detection.
	filetype plugin on
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Reload vimrc when changed
	augroup reload_vimrc " {{{
		autocmd!
		autocmd BufWritePost $MYVIMRC,$MYGVIMRC source <amatch>
	augroup END " }}}

	" Enable OmniCompletion
	set omnifunc=syntaxcomplete#Complete
	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx " {{{
		autocmd!

		" For all text files set 'textwidth' to 78 characters.
		"autocmd FileType text setlocal textwidth=78

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\   exe "normal g`\"" |
		\ endif

	augroup END " }}}

	"autocmd BufWinLeave *.otl mkview
	"autocmd BufWinEnter *.otl silent loadview
	"autocmd BufWinLeave *.otl write
	
	augroup file_associations " {{{
		autocmd!

		" associate *.pyc_dis with python filetype
		au BufRead,BufNewFile *.pyc_dis set filetype=python

		" Remove fugitive buffers when they're left
		autocmd BufReadPost fugitive://* set bufhidden=delete

		" Don't pollute the Dropbox
		autocmd BufReadPre */Dropbox/* BackupOff

		au BufNewFile,BufRead SCons* set filetype=scons

		autocmd BufRead *.gnuplot set filetype=gnuplot
		autocmd BufRead *.plot set filetype=gnuplot
		"autocmd BufRead *.m set filetype=octave
		
		autocmd FileType html,htmldjango,css,js,xml runtime! macros/matchit.vim
	augroup END " }}}
	
	" TeX
	"au BufNewFile,BufRead *.tex,*.latex,*.ltx set efm=%E!\ LaTeX\ %trror:\ %m,
	"	\%E!\ %m,
	"	\%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#,
	"	\%+W%.%#\ at\ lines\ %l--%*\\d,
	"	\%WLaTeX\ %.%#Warning:\ %m,
	"	\%Cl.%l\ %m,
	"	\%+C\ \ %m.,
	"	\%+C%.%#-%.%#,
	"	\%+C%.%#[]%.%#,
	"	\%+C[]%.%#,
	"	\%+C%.%#%[{}\\]%.%#,
	"	\%+C<%.%#>%.%#,
	"	\%C\ \ %m,
	"	\%-GSee\ the\ LaTeX%m,
	"	\%-GType\ \ H\ <return>%m,
	"	\%-G\ ...%.%#,
	"	\%-G%.%#\ (C)\ %.%#,
	"	\%-G(see\ the\ transcript%.%#),
	"	\%-G\\s%#,
	"	\%+O(%f)%r,
	"	\%+P(%f%r,
	"	\%+P\ %\\=(%f%r,
	"	\%+P%*[^()](%f%r,
	"	\%+P[%\\d%[^()]%#(%f%r,
	"	\%+Q)%r,
	"	\%+Q%*[^()])%r,
	"	\%+Q[%\\d%*[^()])%r

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
set shiftround
function! TabSize(size)
	let &tabstop=a:size
	let &shiftwidth=a:size
	let &softtabstop=a:size
endfunction
command! -nargs=1 TabSize call TabSize(<args>)

TabSize 3

" MiniBufExplore
" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1

" Saner handling of large files (via LargeFiles).
" Files larger than 10MB are large
let g:LargeFile = 10

" Fugitive (convenience bindings)
nnoremap [git] <Nop>
nmap <leader>g [git]
nmap <silent> [git]s :Gstatus<CR>
nmap <silent> [git]d :Gdiff<CR>
function! Gdifflist(args)
	let explanation = { 'M': 'Modified', 'A': 'Added', 'D': 'Deleted'}
	let qflist = []
	for line in split(system("git diff --name-status " . shellescape(a:args)), '\n')
		let data = split(line, '\t')
		call add(qflist, {'filename': join(data[1:], '\t'), 'type': data[0][0], 'text':explanation[data[0][0]]})
	endfor
	call setqflist(qflist)
endfunction
command! -nargs=* Gdifflist call Gdifflist("<args>")

" Gitv, the love child of fugitive
let g:Gitv_OpenHorizontal = 'auto'

nmap <silent> [git]v :Gitv<CR>
nmap <silent> [git]V :Gitv --all<CR>

" Vimoutliner
let g:votl_modules_load = ''
let g:vo_modules_load = ':clock'

" RagTag
let g:ragtag_global_maps = 1

" Unite (trying to replace other fuzzyfinders
"let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
call unite#custom#source('file_rec', 'filters',
		\ ['converter_relative_word', 'matcher_default',
		\  'sorter_default', 'converter_relative_abbr'])
" Unite prefix
nnoremap [unite] <Nop>
nmap <leader>u [unite]
nnoremap <silent> [unite]u :Unite -direction=below file_rec<CR>
nnoremap <silent> [unite]b :Unite -direction=below buffer<CR>
nnoremap <silent> [unite]t :Unite -direction=below tag<CR>
nnoremap <silent> [unite]f :Unite -direction=below file<CR>
nnoremap <silent> [unite]F :UniteWithBufferDir -direction=below file<CR>
nnoremap  [unite]s  :<C-u>Unite -direction=below source<CR>
nnoremap <silent> [unite]r  :<C-u>Unite -direction=below
		\ -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite -direction=below outline<CR>
nnoremap <silent> [unite]c :Unite -direction=below command<CR>
command! Colorscheme Unite colorscheme

" NarrowRegion
let g:nrrw_rgn_protect = 'n'

nmap <silent> <leader>t :noautocmd vimgrep /TODO/j **<CR>:cw<CR>

" Copy current filename to "+
nmap <silent> <leader>f :let @+=expand("%")<CR>
nmap <silent> <leader>F :let @+=expand("%:p")<CR>
nmap <silent> <leader>l :let @+=expand("%").":".line(".")<CR>
nmap <silent> <leader>L :let @+=expand("%:p").":".line(".")<CR>

" Write before :make
set autowrite

" Org-Mode
let g:org_heading_shade_leading_stars = 0

" LaTeX commands-surround
let g:surround_{char2nr('c')} = "\\\1command\1{\r}"
" Doxygen syntax in c-comments
let g:load_doxygen_syntax = 1

let g:bufExplorerFindActive = 1
let g:bufExplorerShowRelativePath = 1

let NERDChristmasTree = 1
let NERDTreeSortDirs = 1
let NERDTreeIgnore = ['\~$','\.o$','\.elf$','\.class$','\.aux$','\.fls$','\.out$','\.\d*\(gf\|pk\)$','\.tfm$','\.tmproj$','\.pyc$','^__pycache__$']

let Tlist_Use_Right_Window=1

" Remap some keys
nmap <C-j> <C-]>
nmap g<C-j> g]
nmap <C-k> <C-t>
cmap <C-j> <Down>
cmap <C-k> <Up>

nnoremap <silent> <C-W>z :pclose<Bar>:cclose<Bar>:lclose<CR>

" map <F2> to toggle NERDTree window
nmap <silent> <S-F2> :NERDTreeFind<CR>
nmap <silent> <F2> :NERDTreeToggle<CR>

" Toggle linenumbers
nmap <silent> <F3> :set nu!<CR>:echo "Line numbers: " . strpart("OffOn", 3* &nu,3)<CR>

" Toggle highlight search term
nmap <silent> <F4> :set hls!<CR>:echo "Search highlight: " . strpart("OffOn", 3* &hls,3)<CR>

" Toggle Gundo
nmap <silent> <F7> :GundoToggle<CR>

" Toggle Tlist
"nmap <silent> <F8> :TlistToggle<CR>
" Toggle Tagbar
nmap <silent> <F8> :TagbarToggle<CR>

" Toggle SrcExpl
nmap <silent> <F9> :SrcExplToggle<CR>

" Toggle show invisibles
"nmap <silent> ti	:set list!<CR>:echo "Show invisibles: " . strpart("OffOn", 3* &list,3)<CR>

" Toggle softwrap
"nmap tw :set wrap!<CR>:echo "Softwrap: " . strpart("OffOn", 3* &wrap,3)<CR>
set linebreak
"set showbreak=\ \ \ 
"nmap tW :set linebreak!<CR>:echo "Break words: " . strpart("OffOn", 3* !&linebreak,3)<CR>

nmap <silent> <S-F3> :call ToggleFoldColumn()<CR>
function! ToggleFoldColumn()
	if &foldcolumn==0
		set foldcolumn=1
	else
		set foldcolumn=0
	endif
	echo "Show folds: " . strpart("OffOn", 3* &foldcolumn,3)
endfunction

"nmap <silent> <F5> :make
function! MakeCommand(command)
	nmap <silent> <F5> a:command<CR><CR>
endfunction
command! -nargs=1 MakeCommand call MakeCommand(<args>)
nmap <silent> <F5> :!tmux send-keys -t tests "failsucc.sh django-admin.py test articles" Enter<CR><CR>
nmap <silent> <S-F5> :!tmux send-keys -t tests "failsucc.sh django-admin.py test" Enter<CR><CR>

" let VCSCommandGitExec = '/opt/local/bin/git'

set foldmethod=marker

" Toggle Make and SCons
"nmap <silent> t<F5> :call ToggleScons()<CR>
"function! ToggleScons()
"	if &makeprg=='make'
"		set makeprg=scons
"		echo "SCons set as builder"
"	else
"		set makeprg=make
"		echo "Make set as builder"
"	endif
"endfunction

" CuTest, not perfected, doesn't list test yet...
set efm^=%n)\ %s:%f:%l:%m

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

" Tab-complete menu
set wildmenu

" Remove the hated K-binding
map K <nop>

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
iab <expr> _xdts strftime("%Y%m%d%H%M%S")
cab <expr> xdts strftime("%Y%m%d%H%M%S")

" Stronger encryption
set cryptmethod=blowfish

set laststatus=2


function! ClutterTurnOn()
	set ruler
	set laststatus=2
endfunction
function! ClutterTurnOff()
	set noruler
	set laststatus=1
endfunction
command! ClutterOn  call ClutterTurnOn()
command! ClutterOff call ClutterTurnOff()

function! BackupTurnOn()
	set backup
	set writebackup
	set swapfile
endfunction
function! BackupTurnOff()
	set nobackup
	set nowritebackup
	set noswapfile
endfunction
command! BackupOn  call BackupTurnOn()
command! BackupOff call BackupTurnOff()

function! Marked()
	silent! !open -a Marked "%"
	echo "Opened file i Marked.app"
endfunction
command! Marked call Marked()
