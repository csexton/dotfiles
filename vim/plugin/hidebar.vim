
set guioptions-=T "get rid of toolbar
:let g:toggleTool = 0
map <silent> <S-F1> :if g:toggleTool == 1<CR>:set guioptions-=T<CR>:let g:toggleTool = 0<CR>:else<CR>:set guioptions+=T<CR>:let g:toggleTool = 1<CR>:endif<CR>

"set guioptions-=m "get rid of menu
:let g:toggleMenu = 0
map <silent> <S-F2> :if g:toggleMenu == 1<CR>:set guioptions-=m<CR>:let g:toggleMenu = 0<CR>:else<CR>:set guioptions+=m<CR>:let g:toggleMenu = 1<CR>:endif<CR> 

