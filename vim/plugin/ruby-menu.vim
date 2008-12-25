" Created by: Bob Hicks, bobx@linuxmail.org
" Last modified: 2002-01-22
"
" File: ruby-menu.vim
" Usage: place it in your 'plugin' directory
" Requirements: Made for ViM 6.0

" Create mappings
map <F5> :!ruby %<cr>
map <C-F5> :!ri <cword><cr>
map <S-F5> :!ruby % <cword><cr>
map <C-F6> :call RubyCommentSelection()<cr>
map <S-F6> :call RubyUncommentSelection()<cr>

" Create menus
amenu &Ruby.&Run<tab>F5 :!ruby %<cr>
amenu &Ruby.R&I<tab>C-F5 :!ri <cword><cr>
amenu &Ruby.R&un+<tab>S-F5 :!ruby % <cword><cr>
nmenu &Ruby.-Sep1- :
vmenu <silent> &Ruby.&Comment<tab>C-F6 :call RubyCommentSelection()<cr>
nmenu <silent> &Ruby.&Comment<tab>C-F6 :call RubyCommentSelection()<cr>
vmenu <silent> &Ruby.U&ncomment<tab>S-F6 :call RubyUncommentSelection()<cr>
nmenu <silent> &Ruby.U&ncomment<tab>S-F6 :call RubyUncommentSelection()<cr>

" Comment out selected lines
" commentString is inserted in non-empty lines, should be aligned with block
function! RubyCommentSelection()  range
  let commentString = "#"
  let cl = a:firstline
  let ind = 100

  " Look for smallest indent
  while (cl <= a:lastline)
    if strlen(getline(cl))
      let cind = indent(cl)
      let ind = ((ind < cind) ? ind : cind)
    endif
    let cl = cl + 1
  endwhile
  if (ind == 100)
    let ind = 1
  else
    let ind = ind + 1
  endif

  let cl = a:firstline
  execute ":".cl
  " Insert commentString in each non-empty line, in column ind
  while (cl <= a:lastline)
    if strlen(getline(cl))
      execute "normal ".ind."|i".commentString
    endif
    execute "normal j"
    let cl = cl + 1
  endwhile
endfunction

" Uncomment selected lines
function! RubyUncommentSelection()  range
  let commentString = "#"
  let cl = a:firstline
  while (cl <= a:lastline)
    let ul = substitute(getline(cl),
             \"\\(\\s*\\)".commentString."\\(.*\\)$", "\\1\\2", "")
    call setline(cl, ul)
    let cl = cl + 1
  endwhile
endfunction
