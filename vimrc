" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

syntax on

" Soft word wrap
set formatoptions+=l
set linebreak

" Show position
set ruler

" Make vim look like vim
"set laststatus=2
"
" Sane searches
set ignorecase
set smartcase

" Set terminal title if in terminal
set title

let mapleader = ","

" vim-plug
call plug#begin('~/.vim/plugged')

" surround
Plug 'tpope/vim-surround'

" fzf
Plug '/usr/local/opt/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" fugitive
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'

" Speeddating (handle dates as if they were numbers)
Plug 'tpope/vim-speeddating'

" Nerd tree sidebar
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Tagbar (outline for source-files)
Plug 'majutsushi/tagbar'

" Colorschemes
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
"autocmd! User togglebg.vim colorscheme solarized

" Powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" One possible alternative would be Plug 'itchyny/lightline.vim'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Org-mode (Still too buggy)
"Plug 'https://github.com/jceb/vim-orgmode.git'

call plug#end()

nmap <silent> <leader>ig :IndentGuidesToggle<CR>

nnoremap [fzf] <Nop>
nmap <silent> <leader><space> [fzf]
nmap <silent> [fzf]b :Buffers<CR>
nmap <silent> [fzf]f :Files<CR>
nmap <silent> [fzf]t :Tags<CR>

nnoremap [git] <Nop>
nmap <leader>g [git]
nmap <silent> [git]s :Gstatus<CR>
nmap <silent> [git]b :Gblame<CR>
nmap <silent> [git]v :Gitv<CR>
nmap <silent> [git]V :Gitv --all<CR>

" Config for Nerd-tree
nmap <silent> <F2> :NERDTreeToggle<CR>
let NERDChristmasTree = 1
let NERDTreeSortDirs = 1
let NERDTreeIgnore = ['\~$','\.o$','\.elf$','\.class$','\.aux$','\.fls$','\.out$','\.\d*\(gf\|pk\)$','\.tfm$','\.tmproj$','\.pyc$','^__pycache__$']

" Config for Tagbar
nmap <silent> <leader>tb :TagbarToggle<CR>

" Linenumbers
nmap <silent> <F3> :set nu!<CR>:echo "Line numbers: " . strpart("OffOn", 3* &nu,3)<CR>

" RipGrep
set grepprg=rg\ --vimgrep

set cursorline

colorscheme Tomorrow
