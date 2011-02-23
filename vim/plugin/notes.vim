" notes.vim
" Maintainer:   Christopher Sexton
"

" Code {{{1
" Exit quickly when:
" - this plugin was already loaded (or disabled)
" - when 'compatible' is set
if (exists("g:loaded_notes") && g:loaded_notes) || &cp
    finish
endif
let g:loaded_note = 1

let s:cpo_save = &cpo
set cpo&vim

if !exists('g:notes_path')
    let g:notes_path = $HOME . "/Notes"
endif

"function! Notes()
"  exe "e ~/Notes/"
"endfunction
"command! -nargs=0 Notes :call Notes()
"
"function! Note(name)
"  exe "e ~/Notes/".a:name."*"
"endfunction
"command! -nargs=1 Note :call Note(<q-args>)


function Note()
    let title = input("Name that sexy note: ")
    if title != ''
        let file_name = substitute(tolower(title), ' ', '-', 'g') . ".markdown"
        exe "e " . g:notes_path . "/" . file_name
    else
        echo "You must specify a name, yo."
    endif
endfunction
command! -nargs=? -range=% Note :call Note()

function Notes()
    exe "e " . g:notes_path
endfunction
command! -nargs=? -range=% Notes :call Notes()
let &cpo = s:cpo_save
" }}}1

"map <Leader>nn  :Note<CR>
"map <Leader>nl  :Notes<CR>

" vim:set ft=vim ts=8 sw=4 sts=4:
