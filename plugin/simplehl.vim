"=============================================================================
" File: simplehl.vim
" Author: sumoooru2
" Created: 2016-04-30
" License: MIT License
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_simplehl')
    finish
endif
let g:loaded_simplehl = 1

let s:save_cpo = &cpo
set cpo&vim

nnoremap <silent> <Plug>(simplehl::toggle) :SimplehlToggle<CR>
nnoremap <silent> <Plug>(simplehl::reset) :SimplehlReset<CR>

command! -nargs=0 SimplehlToggle call simplehl#toggle(expand('<cword>'))
command! -nargs=0 SimplehlReset call simplehl#init()


let &cpo = s:save_cpo
unlet s:save_cpo
