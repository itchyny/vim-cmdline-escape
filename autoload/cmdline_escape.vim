" =============================================================================
" Filename: autoload/cmdline_escape.vim
" Author: itchyny
" License: MIT License
" Last Change: 2015/01/01 00:00:00.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! cmdline_escape#escape(char, type) abort
  return (s:get_escape(a:type)[0] ? '\' : '') . a:char
endfunction

function! cmdline_escape#backspace(type) abort
  return repeat("\<BS>", s:get_escape(a:type)[1])
endfunction

function! s:get_escape(type) abort
  if getcmdtype() !=# a:type && a:type !=# ''
    return [0, 1]
  endif
  let line = getcmdline()
  let pos = getcmdpos()
  let noescape = 1
  let charlen = 1
  if pos
    for i in range(pos - 1)
      let charlen = (noescape ? 0 : charlen) + 1
      let noescape = !noescape || line[i] !=# '\'
    endfor
  endif
  return [noescape, charlen]
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
