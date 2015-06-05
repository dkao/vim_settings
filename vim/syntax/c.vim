" Source original syntax file
source $VIMRUNTIME/syntax/c.vim

" Modification from
" http://stackoverflow.com/questions/736701/class-function-names-highlighting-in-vim

" Highlight Class and Function names
syn match    cCustomParen    "(" contains=cParen contains=cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

"hi def cCustomFunc gui=bold guifg=blue
"hi def cCustomClass gui=reverse guifg=yellowgreen

hi def link cCustomFunc  Function
hi def link cCustomClass Function

