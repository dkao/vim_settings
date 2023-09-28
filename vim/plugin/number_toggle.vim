" Prevent multi loads and disable in compatible mode
" check if vim version is at least 7.3
" (relativenumber is not supported below)
if exists('g:loaded_numbertoggle') || &cp || v:version < 703
  finish
endif

let g:loaded_numbertoggle = 1

" Removed everything complex from original plugin
" Toggle number on a per-buffer basis
function! NumberToggle()
  set number!
  if (&number != 0)
    set relativenumber
  else
    set norelativenumber
  endif
endfunc

function! s:DisableRelativeNumber()
  if (&number != 0)
    set norelativenumber
  endif
endfunc

function! s:EnableRelativeNumber()
  if (&number != 0)
    set relativenumber
  endif
endfunc

" Automatically switch to absolute numbers when focus is lost and switch back
" when the focus is regained.
autocmd FocusLost * :call s:DisableRelativeNumber()
autocmd FocusGained * :call s:EnableRelativeNumber()
autocmd WinLeave * :call s:DisableRelativeNumber()
autocmd WinEnter * :call s:EnableRelativeNumber()

" Switch to absolute line numbers when the window loses focus and switch back
" to relative line numbers when the focus is regained.
autocmd WinLeave * :call s:DisableRelativeNumber()
autocmd WinEnter * :call s:EnableRelativeNumber()

" Switch to absolute line numbers when entering insert mode and switch back to
" relative line numbers when switching back to normal mode.
autocmd InsertEnter * :call s:DisableRelativeNumber()
autocmd InsertLeave * :call s:EnableRelativeNumber()

" ensures default behavior / backward compatibility
if ! exists ( 'g:UseNumberToggleTrigger' )
  let g:UseNumberToggleTrigger = 0
endif

if exists('g:NumberToggleTrigger')
  exec "nnoremap <silent> " . g:NumberToggleTrigger . " :call NumberToggle()<cr>"
elseif g:UseNumberToggleTrigger
  nnoremap <silent> <C-n> :call NumberToggle()<cr>
endif
