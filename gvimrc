"set noanti
"set nomacatsui

"set guioptions=aegiMt

" No more GtkTabs!!!!
set guioptions-=e

" No menu
set guioptions-=m

" No toolbar
set guioptions-=T

" No scrollbars
set guioptions-=L
set guioptions-=l
set guioptions-=R
set guioptions-=r
set guioptions-=b
set guioptions-=h

"set gfn=Bitstream\ Vera\ Sans\ Mono\ 8
set gfn=Monaco:h9

"highlight StatusLine    guifg=Black   guibg=#aabbee gui=bold ctermfg=Black ctermbg=White  cterm=bold
"highlight StatusLineNC  guifg=#444444 guibg=#888888 gui=none ctermfg=Black ctermbg=Grey   cterm=none

"highlight Cursor        guifg=Black guibg=Magenta ctermfg=Black ctermbg=White
	":highlight Folded guibg=grey guifg=blue
	":highlight FoldColumn guibg=darkgrey guifg=white

"highlight VertSplit		guifg=Black guibg=White

"highlight Folded			guibg=#333333

set cursorline

" Show invisibles
set listchars=tab:▸\ ,eol:¬

" Nice linebreaks
set showbreak=↪

" Invisible character colors
"highlight NonText		guifg=#373A3C
"highlight SpecialKey	guifg=#373A3C
"highlight NonText		guifg=#c0c0c0
"highlight SpecialKey	guifg=#c0c0c0

" Fix window cycling
nnoremap <silent> <D-lt> :macaction _cycleWindows:<CR>
nnoremap <silent> <D->> :macaction _cycleWindowsBackwards:<CR>
