" =============================================================================
" Filename: plugin/cmdline_escape.vim
" Author: itchyny
" License: MIT License
" Last Change: 2015/02/26 02:41:56.
" =============================================================================

if exists('g:loaded_cmdline_escape') || v:version < 700
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

cnoremap <expr> <Plug>(cmdline-escape-/) cmdline_escape#slash()
cnoremap <expr> <Plug>(cmdline-escape-?) cmdline_escape#escape('?', '/')
cnoremap <expr> <Plug>(cmdline-escape-~) cmdline_escape#escape('~', '/')
cnoremap <expr> <Plug>(cmdline-escape-bs) cmdline_escape#backspace('')

if get(g:, 'cmdline_escape_default_mapping', 1)
  cmap / <Plug>(cmdline-escape-/)
  cmap ? <Plug>(cmdline-escape-?)
  cmap ~ <Plug>(cmdline-escape-~)
  cmap <BS> <Plug>(cmdline-escape-bs)
endif

let g:loaded_cmdline_escape = 1

let &cpo = s:save_cpo
unlet s:save_cpo
