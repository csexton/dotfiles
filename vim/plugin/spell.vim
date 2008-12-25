if has("spell")
  " turn spelling on by default, but only for gui
  if has("gui_running")
    set spell
  endif

  " toggle spelling with F4 key
  map <F7> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

  " they were using white on white
  highlight PmenuSel ctermfg=black ctermbg=lightgray

  " limit it to just the top 10 items
  set sps=best,10
endif
