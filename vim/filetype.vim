augroup filetypedetect
au BufNewFile,BufRead *.moin setf moin
au BufNewFile,BufRead *.wiki setf moin
au BufNewFile,BufRead *.trac setf moin
au BufNewFile,BufRead *.txt setf text
au BufNewFile,BufRead .vimprojects setf vimproject
augroup END

 " markdown filetype file
 if exists("did\_load\_filetypes")
     finish
 endif

 augroup markdown
     au! BufRead,BufNewFile *.mkd   setfiletype mkd
 augroup END
runtime! ftdetect/*.vim
