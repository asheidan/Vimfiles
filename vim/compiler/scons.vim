" Vim compiler file
" Compiler:     SCons/GCC
"
" Changelog:
" ?.?:    ....
"
" Contributors:
"
" Todo:
"
" Comments:
"

if exists("current_compiler")
  finish
endif
let current_compiler = "SCons"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=scons

" vim: ft=vim
