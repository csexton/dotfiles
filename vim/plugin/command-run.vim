" command-run.vim - Command-run
" Maintainer:   Christopher Sexton

" Exit quickly when:
" - this plugin was already loaded (or disabled)
" - when 'compatible' is set

"""if (exists("g:loaded_command_run") && g:loaded_command_run) || &cp
"""    finish
"""endif
"""let g:loaded_command_run = 1
"""
"""let s:cpo_save = &cpo
"""set cpo&vim
"""
"""" Code {{{1
"""
"""let g:command_run = "echo 'to use set a command to run in vim with \"let g:command_run = command\"'"
"""function! CommandRun()
"""    exe "silent !" . g:command_run . " &> /tmp/vim.log"
"""endfunction
"""map <D-r> :call CommandRun()<CR>
"""map <Leader>r :call CommandRun()<CR>
"""let &cpo = s:cpo_save
"""" }}}1
"""
"""let &cpo = s:cpo_save

" vim:set ft=vim ts=8 sw=4 sts=4:
