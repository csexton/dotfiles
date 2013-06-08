
  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

  " For cursor moving in insert mode(Not recommended)
  "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
  "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
  "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
  "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
  " Or set this.
  "let g:neocomplcache_enable_cursor_hold_i = 1
  " Or set this.
  "let g:neocomplcache_enable_insert_char_pre = 1

  " AutoComplPop like behavior.
  "let g:neocomplcache_enable_auto_select = 1

  " Shell like behavior(not recommended).
  "set completeopt+=longest
  "let g:neocomplcache_enable_auto_select = 1
  "let g:neocomplcache_disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby let g:rubycomplete_classes_in_global=1

  autocmd FileType unite call s:unite_my_settings()
  function! s:unite_my_settings()"{{{
    " Overwrite settings.
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)

"    nmap <buffer> <ESC>      <Plug>(unite_exit)
"    imap <buffer> jj      <Plug>(unite_insert_leave)
"    "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
"
"    imap <buffer><expr> j unite#smart_map('j', '')
"    imap <buffer> <TAB>   <Plug>(unite_select_next_line)
"    imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
"    imap <buffer> '     <Plug>(unite_quick_match_default_action)
"    nmap <buffer> '     <Plug>(unite_quick_match_default_action)
"    imap <buffer><expr> x
"          \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
"    nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
"    nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
"    imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
"    imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
"    nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
"    nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
"    nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
"    imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
"    nnoremap <silent><buffer><expr> l
"          \ unite#smart_map('l', unite#do_action('default'))
"
"    let unite = unite#get_current_unite()
"    if unite.buffer_name =~# '^search'
"      nnoremap <silent><buffer><expr> r     unite#do_action('replace')
"    else
"      nnoremap <silent><buffer><expr> r     unite#do_action('rename')
"    endif
"
"    nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
"    nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
"          \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
  endfunction"}}}
