" Chris's Settings:
"set backspace=2  
set backspace=indent,eol,start
set errorbells "Ring the bell (beep or screen flash) for error messages.
"set expandtab "Use the appropriate number of spaces to insert a <Tab>.
set gdefault "When on, the ":substitute" flag 'g' is default on.
set hidden " Allow dirty unsaved buffers 
set hls "When there is a previous search pattern, highlight all its matches.
set hlsearch "When there is a previous search pattern, highlight all its matches.
set ignorecase "Ignore case in searches.
set ruler
set smartcase 
set scs "Override the 'ignorecase' option if the search pattern contains upper case characters.
set incsearch "Search as the search is typed.
set magic "Some characters in search pattern are taken literally.
set nobackup "Don't make a backup before overwriting a file.
set nocompatible "I heart VIM, not Vi
set noedcompatible "Makes the 'g' and 'c' flags of the ":substitute" command to be toggled each time the flag is given.
set nowrap "Don't wrap lines wider than the screen
set number "Line numbers, yo.
set scrolloff=3 "Keep some context around the cursor
set shiftwidth=4 "Number of spaces to use for each step of (auto)indent. 
set showmatch "When a bracket is inserted, briefly jump to the matching one. 
set tabstop=4 "A tab counts as 4 spaces
set wrapscan "Searches wrap around the end of the file. 
set guioptions+=c " Use console dialogs where possible
set guioptions-=m " No menu
set guioptions-=T " No toolbar
set wildmenu
set visualbell
syntax on
 		
colorscheme ristoink 

" gVim specific settings:
if has("gui_running")
	if has("mac")
		" Set the size Window size
		set lines=50
		set columns=150
		"winpos 50 50
		"set guifont=Monaco:h11
		set guifont=Envy\ Code\ R:h13
		" Don't antialias in mac gVim
		"set nomacatsui
	endif 

	if has("win32") || has("win64")
		" Start maximized
		au GUIEnter * simalt ~x
		" Set the size Window size
		"set lines=30
		"set columns=140
		"set gfn=Courier_New:h10:cANSI
		set guifont=Consolas:h10:cANSI
	endif
endif

" Windows specific settings:
if has("win32") || has("win64")
	set shell=cmd.exe
	set shellcmdflag=/c
	set shellxquote=\" 
	"autocmd VimEnter * tab all
	"autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"' 

	" Point to ctags in the vim folder 
	let Tlist_Ctags_Cmd = $HOME.'\vimfiles\ctags.exe' " location of ctags tool 

endif

if has("unix")
	noremap <M-LeftMouse> <LeftMouse><Esc><C-V>
	noremap <M-LeftDrag> <LeftDrag> 
	noremap \vb <C-V>
	"noremap <-V> <C-V>
	"source $VIMRUNTIME/mswin.vim
	set mouse=a
endif

if has("mac")
	"Mac Keybindings
	"vnoremap <D-X> "+x
	"vnoremap <D-C> "+y
	"map <D-V>map"+gP
	"cmap <D-V>cmap<C-R>+
	"exe 'inoremap <script> <D-V>' paste#paste_cmd['i']
	"exe 'vnoremap <script> <D-V>' paste#paste_cmd['v']
	"noremap <C-V>noremap<C-V> 
	noremap <D-LeftMouse> <LeftMouse><Esc><C-V>
	noremap <D-LeftDrag> <LeftDrag> 

	"if has("ruby")
	"	map <D-t> :FuzzyFinderTextMate<CR>
	"endif

	" A couple of emacs keybindings for insert mode
	imap  <C-A> <Home>
	cmap  <C-A> <Home>
	imap  <C-E> <End>
	cmap  <C-E> <End>
	imap  <C-k> <Esc>DA

else
	" This is the MS Win stuff that I like, on mac it does not make much
	" sense, but I want it for Linux and Windows

	" CTRL-X is Cut
	vnoremap <C-X> "+x

	" CTRL-C is Copy
	vnoremap <C-C> "+y

	" CTRL-V is Paste
	map <C-V>		"+gP
	cmap <C-V>		<C-R>+

	" Use CTRL-Q to do what CTRL-V used to do
	noremap <C-Q>		<C-V>

	" CTRL-A is Select all
	noremap <C-A> gggH<C-O>G
	inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
	cnoremap <C-A> <C-C>gggH<C-O>G
	onoremap <C-A> <C-C>gggH<C-O>G
	snoremap <C-A> <C-C>gggH<C-O>G
	xnoremap <C-A> <C-C>ggVG
endif

" make Y delete till the end of the line
map Y y$

" backspace in Visual mode deletes selection
vnoremap <BS> d

" Provide an alternative for visual block, in case <C-Q> or <C-V> are not
" working
noremap \vb <C-V>
noremap <C-S-V>		<C-V>

"Enable selecting space with no characters
set virtualedit=block

function! PrettyText() 
	setlocal spell
	setlocal wrap
	setlocal linebreak
endfunction
com! Pretty call PrettyText()

" Omni Complete helpers
set completeopt=longest,menuone
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
inoremap <expr> <c-Space> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" Make tab in v mode work like I think it should (keep highlighting):
vmap <tab> >gv
vmap <s-tab> <gv

" Pressing < or > will let you indent/unident selected lines
vnoremap < <gv
vnoremap > >gv

" From an idea by Michael Naumann, Jürgen Krämer. 
function! VisualSearch(direction) range 
	let l:saved_reg = @" 
	execute "normal! vgvy" 
	let l:pattern = escape(@", '\\/.*$^~[]') 
	let l:pattern = substitute(l:pattern, "\n$", "", "") 
	if a:direction == 'b' 
		execute "normal ?" . l:pattern . "^M" 
	else 
		execute "normal /" . l:pattern . "^M" 
	endif 
	let @/ = l:pattern 
	let @" = l:saved_reg 
endfunction 

vnoremap <silent> * :call VisualSearch('f')<CR> 
vnoremap <silent> # :call VisualSearch('b')<CR>

" CTags settings
" F4:  Switch on/off TagList
"nnoremap <silent> <F4> :TlistToggle<CR> 

" Project settings
" F12: Toggle side bar
nmap <silent> <F12> <Plug>ToggleProject
let proj_flags = "imst"

" BufExplorer is more fun than ls
"map :ls :BufExplorer

" Remap "-" and "=" for surround.vim,
" i.e. yss- will surround the line with <% ... %>
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"


" Ruby Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Ruby Tweaks form http://wiki.rubyonrails.org/rails/pages/HowtoUseVimWithRails
filetype plugin indent on " Enable filetype-specific indenting and plugins
" Load matchit (% to bounce from do to end, etc.)
"runtime! macros/matchit.vim
augroup myfiletypes
	" Clear old autocmds in group
	autocmd!
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

" Rails options
let g:rails_menu=1

" Markdown syntax
augroup mkd
	autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END

if has("ruby")
	map <leader>t :FuzzyFinderTextMate<CR>
endif
