if has("gui_macvim")

  " Disable Command-W
  macmenu File.Close key=<nop>

  " Command-T for CommandT
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>

  " Command-Shift-F for Ack
  " macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>
  " map <D-F> :Ack<space>

  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle<CR>

  macmenu Window.Select\ Next\ Tab key=<nop>
  macmenu Window.Select\ Previous\ Tab key=<nop>

  map <D-{> :bp<CR>
  map <D-}> :bn<CR>
endif
