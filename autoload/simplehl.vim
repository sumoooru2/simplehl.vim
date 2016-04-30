"=============================================================================
" File: simplehl.vim
" Author: shinji
" Created: 2016-04-30
" License: MIT License
"=============================================================================

scriptencoding utf-8

if !exists('g:loaded_simplehl')
    finish
endif
let g:loaded_simplehl = 1

let s:save_cpo = &cpo
set cpo&vim


hi Smr2_0		term=underline cterm=NONE ctermfg=White ctermbg=Blue gui=NONE guifg=None guibg=Blue
hi Smr2_1		term=underline cterm=NONE ctermfg=White ctermbg=Green gui=NONE guifg=None guibg=Green
hi Smr2_2		term=underline cterm=NONE ctermfg=White ctermbg=Cyan gui=NONE guifg=None guibg=Cyan
hi Smr2_3		term=underline cterm=NONE ctermfg=White ctermbg=Red gui=NONE guifg=None guibg=Red
hi Smr2_4		term=underline cterm=NONE ctermfg=White ctermbg=Magenta gui=NONE guifg=None guibg=Magenta
hi Smr2_5		term=underline cterm=NONE ctermfg=White ctermbg=Yellow gui=NONE guifg=None guibg=Yellow
hi Smr2_6		term=underline cterm=reverse ctermfg=Blue ctermbg=White gui=NONE guifg=None guibg=Blue
hi Smr2_7		term=underline cterm=reverse ctermfg=Green ctermbg=White gui=NONE guifg=None guibg=Green
hi Smr2_8		term=underline cterm=reverse ctermfg=Cyan ctermbg=White gui=NONE guifg=None guibg=Cyan
hi Smr2_9		term=underline cterm=reverse ctermfg=Red ctermbg=White gui=NONE guifg=None guibg=Red
hi Smr2_10		term=underline cterm=reverse ctermfg=Magenta ctermbg=White gui=NONE guifg=None guibg=Magenta
hi Smr2_11		term=underline cterm=reverse ctermfg=Yellow  ctermbg=White gui=NONE guifg=None guibg=Yellow

let s:unused = []
let s:registered = {}
let s:used = {}

function! simplehl#init()
	let s:unused = []
	let s:registered = {}
	let s:used = {}
	call clearmatches()
endfunction

function! simplehl#toggle(word)
	if has_key(s:registered, a:word)
		call matchdelete(remove(s:registered, a:word))
		call insert(s:unused, remove(s:used, a:word), 0)
	else
		if empty(s:unused)
			let s:unused = [
						\'Smr2_0', 'Smr2_1', 'Smr2_2', 'Smr2_3', 'Smr2_4', 'Smr2_5',
						\'Smr2_6', 'Smr2_7', 'Smr2_8', 'Smr2_9', 'Smr2_10', 'Smr2_11'
						\]
		endif
		let l:next = remove(s:unused, 0)
		let s:registered[a:word] = matchadd(l:next, '\<' . a:word . '\>')
		let s:used[a:word] = l:next
	endif
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
