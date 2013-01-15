if exists('g:loaded_preso') || &cp
  finish
endif
let g:loaded_preso = 1

function! Find(pattern)
  exe "vimgrep /".a:pattern."/gj **"
  exe "cw"
endfunction
command! -nargs=1 Find :call Find(<q-args>)

function! Preso()
  set background=light
  colorscheme pyte
  set guifont=Monaco:h24
  set antialias
endfunction
command! Preso :call Preso()

