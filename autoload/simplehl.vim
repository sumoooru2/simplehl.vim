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


hi Smr2_0   term=underline  cterm=NONE ctermfg=White   ctermbg=Blue     gui=NONE guifg=White   guibg=Blue   
hi Smr2_1   term=underline  cterm=NONE ctermfg=White   ctermbg=Green    gui=NONE guifg=White   guibg=Green  
hi Smr2_2   term=underline  cterm=NONE ctermfg=White   ctermbg=Cyan     gui=NONE guifg=White   guibg=Cyan   
hi Smr2_3   term=underline  cterm=NONE ctermfg=White   ctermbg=Red      gui=NONE guifg=White   guibg=Red    
hi Smr2_4   term=underline  cterm=NONE ctermfg=White   ctermbg=Magenta  gui=NONE guifg=White   guibg=Magenta
hi Smr2_5   term=underline  cterm=NONE ctermfg=White   ctermbg=Yellow   gui=NONE guifg=White   guibg=Yellow 
hi Smr2_6   term=underline  cterm=NONE ctermfg=Blue    ctermbg=White    gui=NONE guifg=Blue    guibg=White  
hi Smr2_7   term=underline  cterm=NONE ctermfg=Green   ctermbg=White    gui=NONE guifg=Green   guibg=White  
hi Smr2_8   term=underline  cterm=NONE ctermfg=Cyan    ctermbg=White    gui=NONE guifg=Cyan    guibg=White  
hi Smr2_9   term=underline  cterm=NONE ctermfg=Red     ctermbg=White    gui=NONE guifg=Red     guibg=White  
hi Smr2_10  term=underline  cterm=NONE ctermfg=Magenta ctermbg=White    gui=NONE guifg=Magenta guibg=White  
hi Smr2_11  term=underline  cterm=NONE ctermfg=Yellow  ctermbg=White    gui=NONE guifg=Yellow  guibg=White  

function! simplehl#init()
    let w:unused = []
    let w:registered = {}
    let w:used = {}
    call clearmatches()
endfunction

function! simplehl#reset()
    let l:wid = win_getid()
    windo call simplehl#init()
    call win_gotoid(l:wid)
endfunction

function! simplehl#check()
    if !exists('w:unused')
        call simplehl#init()
    endif
endfunction

function! simplehl#rem(word)
    call simplehl#check()
    try
        call matchdelete(remove(w:registered, a:word))
        call insert(w:unused, remove(w:used, a:word), 0)
    catch
    endtry
endfunction

function! simplehl#add(word, next)
    call simplehl#check()
    let w:registered[a:word] = matchadd(a:next, '\<' . a:word . '\>')
    let w:used[a:word] = a:next
endfunction

function! simplehl#toggle(word)
    call simplehl#check()
    if has_key(w:registered, a:word)
        let l:wid = win_getid()
        windo call simplehl#rem(a:word)
        call win_gotoid(l:wid)
    else
        if empty(w:unused)
            let w:unused = [
                        \'Smr2_0', 'Smr2_1', 'Smr2_2', 'Smr2_3', 'Smr2_4', 'Smr2_5',
                        \'Smr2_6', 'Smr2_7', 'Smr2_8', 'Smr2_9', 'Smr2_10', 'Smr2_11'
                        \]
        endif
        let l:next = remove(w:unused, 0)
        let l:wid = win_getid()
        windo call simplehl#add(a:word, l:next)
        call win_gotoid(l:wid)
    endif
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
