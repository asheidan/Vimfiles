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
set laststatus=2
"
" Sane searches
set ignorecase
set smartcase

" Set terminal title if in terminal
set title

" Faster macros
set lazyredraw

let mapleader = ","

" vim-plug
call plug#begin('~/.vim/plugged')

" surround
Plug 'tpope/vim-surround'

" commantary
Plug 'tpope/vim-commentary'

" fzf
"Plug '/usr/share/vim/vimfiles/plugin/fzf.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
let g:fzf_layout = { 'down': '40%' }

Plug 'benwainwright/fzf-project'
let g:fzfSwitchProjectProjects = [ '~/.vim' ]
let g:fzfSwitchProjectWorkspaces = [ '~/Documents/Codemill/Adlede', '~/Documents/Projects' ]
let g:fzfSwitchProjectAlwaysChooseFile = 0

" fugitive
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Tabular
Plug 'godlygeek/tabular'

" Speeddating (handle dates as if they were numbers)
Plug 'tpope/vim-speeddating'

" Highligt region yanked
Plug 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 200
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

" Nerd tree sidebar
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <S-F2> :NERDTreeFind<CR>
let NERDChristmasTree = 1
let NERDTreeSortDirs = 1
let NERDTreeIgnore = ['\~$','\.o$','\.elf$','\.class$','\.aux$','\.fls$','\.out$','\.\d*\(gf\|pk\)$','\.tfm$','\.tmproj$','\.pyc$','^__pycache__$']

" Indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Tagbar (outline for source-files)
Plug 'majutsushi/tagbar'
nmap <silent> <leader>tb :TagbarToggle<CR>
nmap <silent> <F4> :TagbarToggle<CR>

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'romgrk/doom-one.vim'
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'tomasr/molokai'
"autocmd! User togglebg.vim colorscheme solarized

" Buggy themes
"Plug 'ayu-theme/ayu-vim' " This is not a good vim-citizen yet
"let ayucolor = 'light'

" Powerline
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
" One possible alternative would be Plug 'itchyny/lightline.vim'
Plug 'itchyny/lightline.vim'
function! LightLineProjectName()
	return fnamemodify(getcwd(), ':~:t')
endfunction
let g:lightline = {}
let g:lightline.colorscheme = 'one'
let g:lightline.component_expand = {
      \     'linter_checking': 'lightline#ale#checking',
      \     'linter_infos': 'lightline#ale#infos',
      \     'linter_warnings': 'lightline#ale#warnings',
      \     'linter_errors': 'lightline#ale#errors',
      \     'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
let g:lightline.component_function = {
      \    'projectname': 'LightLineProjectName' }
let g:lightline.active = {
      \    'left': [ [ 'mode', 'paste' ],
      \              [ 'projectname', 'readonly', 'relativepath', 'modified' ] ],
      \    'right': [ ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'],
      \               [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]],
      \ }
let g:lightline.inactive = {
      \    'left': [ [ 'relativepath' ] ] }

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Org-mode (Still too buggy) (but let's try it again)
Plug 'https://github.com/jceb/vim-orgmode.git'

" Inline linting and LSP-client
Plug 'dense-analysis/ale'
let g:ale_lint_on_text_changed = 'never'
let g:ale_completion_enabled = 1
" https://github.com/maximbaz/lightline-ale
Plug 'maximbaz/lightline-ale'

"Plug 'liuchengxu/vim-which-key'

" TODO: Easily turn off hlsearch
" https://stackoverflow.com/a/26504944/106746

" Syntax plugins
" Terraform
Plug 'hashivim/vim-terraform'

call plug#end()

let mapleader = ' '

" This is handled by the bar now
set noshowmode

set showcmd

nmap <silent> <leader>ig :IndentGuidesToggle<CR>

"nnoremap [fzf] <Nop>
"nmap <silent> <leader><space> [fzf]
nmap <silent> <leader><space> :Files<CR>
"nmap <silent> [fzf]b :Buffers<CR>
nmap <silent> <leader>< :Buffers<CR>
"nmap <silent> [fzf]f :Files<CR>
"nmap <silent> [fzf]t :Tags<CR>

nnoremap [git] <Nop>
nmap <leader>g [git]
nmap <silent> [git]s :Gstatus<CR>
nmap <silent> [git]b :Gblame<CR>
nmap <silent> [git]v :Gitv<CR>
nmap <silent> [git]V :Gitv --all<CR>

nnoremap [project] <Nop>
nmap <leader>p [project]
nmap <silent> [project]p :FzfSwitchProject<CR>

" Linenumbers
nmap <silent> <F3> :set nu!<CR>:echo "Line numbers: " . strpart("OffOn", 3* &nu,3)<CR>

" RipGrep
set grepprg=rg\ --vimgrep

set cursorline

set bg=light

colorscheme onehalflight
