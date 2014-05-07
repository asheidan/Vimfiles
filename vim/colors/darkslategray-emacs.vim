" vim: set tw=0 sw=4 sts=4 et:

" Vim color file

" Emacs in RedHat Linux used to have (still does?) a kind of 'Wheat on
" DarkSlateGray' color scheme by default. This color scheme is created from a
" theme file believed to be the same theme.
"
" https://github.com/emacs-jp/replace-colorthemes/blob/master/classic-theme.el
"
" Darkslategray is intended to be nice to your eyes (low contrast) and to take
" advantage of syntax hilighting as much as possible.
"
" Needs at least vim 6.0.


" Init stuff

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "darkslategray-emacs"


" GUI colors

hi Cursor               guifg=fg guibg=#da70d6
hi CursorIM             guifg=NONE guibg=#ff83fa
hi CursorLine           guibg=#2f5453
hi Directory            guifg=#e0ffff
hi DiffAdd              guibg=#232f3d
hi DiffChange           guibg=#26223d
hi DiffDelete           gui=NONE guifg=#784042 guibg=#3d2623
hi DiffText             gui=NONE guibg=#6959cd
hi ErrorMsg             gui=NONE guifg=#ffffff guibg=#ff0000
hi VertSplit            gui=NONE guifg=#000000
hi Folded               guifg=#427978 guibg=bg
hi FoldColumn           guifg=fg guibg=#427978
hi SignColumn           gui=NONE guifg=#bdb76b guibg=#20b2aa
hi IncSearch            gui=NONE guifg=#000000 guibg=#ffffff
hi LineNr               gui=NONE guifg=#bdb76b guibg=#2f5453
hi CursorLineNr         gui=bold guifg=fg guibg=bg
hi ModeMsg              gui=NONE
hi MoreMsg              gui=NONE guifg=#20b2aa
hi NonText              gui=NONE guifg=#ffffff
hi Normal               guibg=#213b3b guifg=#f1d7a4
hi Question             gui=NONE guifg=#ff6347
hi Search               gui=NONE guifg=#000000 guibg=#ffd700
hi SpecialKey           guifg=#00ffff

hi StatusLine           gui=reverse
hi StatusLineNC         gui=NONE guifg=#68c3c1 guibg=#427978

hi Title                gui=NONE guifg=#ff6347
hi Visual               gui=NONE guibg=#427978
hi VisualNOS            gui=NONE guifg=#000000 guibg=fg
hi WarningMsg           guifg=#ffffff guibg=#ff6347
hi WildMenu             gui=NONE guifg=#000000 guibg=#ffff00

hi TabLineFill          guifg=fg guibg=bg


" I use GTK and don't wanna change these
"hi Menu foobar
"hi Scrollbar foobar
"hi Tooltip foobar


" Colors for syntax highlighting
hi Comment              guifg=#bf392b

hi Constant             guifg=#71ffca
    hi String           guifg=#c06c4f
    hi Character        guifg=#7fffd4
    hi Number           guifg=#ff6347
    hi Boolean          guifg=#cdcd00
    hi Float            guifg=#ff6347

hi Identifier           guifg=#afeeee
    hi Function         guifg=#52a7fe

hi Statement            gui=NONE guifg=#4682b4
    hi Conditional      gui=NONE guifg=#4682b4
    hi Repeat           gui=NONE guifg=#4682b4
    hi Label            gui=NONE guifg=#4682b4
    hi Operator         gui=NONE guifg=#4682b4
    hi Keyword          gui=NONE guifg=#20fffe
    hi Exception        gui=NONE guifg=#4682b4

hi PreProc              guifg=#cdcd00
    hi Include          guifg=#ffff00
    hi Define           guifg=#cdcd00
    hi Macro            guifg=#cdcd00
    hi PreCondit        guifg=#cdcd00

hi Type                 gui=NONE guifg=#6bc568
    hi StorageClass     guifg=#00ff00
    hi Structure        guifg=#20b2aa
    hi Typedef          guifg=#00ff7f

hi Special              guifg=#ff6347
    "Underline Character
    hi SpecialChar      gui=underline guifg=#7fffd4
    hi Tag              guifg=#ff6347
    "Statement
    hi Delimiter        gui=NONE guifg=#b0c4de
    "Bold comment (in Java at least)
    hi SpecialComment   gui=NONE guifg=#da70d6
    hi Debug            gui=NONE guifg=#ff0000

hi Underlined           gui=underline

hi Ignore               guifg=bg

hi Error                gui=NONE guifg=#ffffff guibg=#ff0000

hi Todo                 gui=NONE guifg=#000000 guibg=#ff83fa

