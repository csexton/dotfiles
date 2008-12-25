" usage:
" (the same as ack, except that the path is required)
" examples: 
" :Ack TODO .
" :Ack sub Util.pm

function! Ack(args)
    let cmd = "ack -H --nocolor --nogroup " . a:args
    echo "running: " . cmd

    let tmpfile = tempname()
    let cmd = cmd . " > " . tmpfile
    call system(cmd)

    let efm_bak = &efm
    set efm=%f:%l:%m
    execute "silent! cgetfile " . tmpfile
    let &efm = efm_bak
    botright copen

    call delete(tmpfile)
endfunction

command! -nargs=* -complete=file Ack call Ack(<q-args>)

" \F to startup an ack search
map <leader>F :Ack<space>

