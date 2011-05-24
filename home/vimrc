""" Settings
set nocompatible
set autoindent
set autoread
set autowrite       " Automatically save before commands like :next and :make
set backspace=indent,eol,start
""set backup          " Do keep a backup file
set backupskip+=*.tmp,crontab.*
set cmdheight=1
set complete-=i     " Searching includes can be slow
set dictionary+=/usr/share/dict/words
set display=lastline " When lines are cropped at the screen bottom, show as much as possible
set expandtab
set nofoldenable
set gdefault        " When on, the ":substitute" flag 'g' is default on.
set guioptions=cg   " Get rid of the scrollbar and toolbar
set hidden          " Allow dirty unsaved buffers
set history=1000    " Remember more history
set hlsearch        " Highlight searches
set ignorecase      " Ignore case in searches.
set incsearch       " Incremental search
set joinspaces
set laststatus=2    " Always show status line
set list            " show trailing whiteshace and tabs
"set listchars=tab:▸\ ,trail:-,extends:>,precedes:<,nbsp:+    " ,eol:¬
set listchars=tab:»\ ,trail:·,extends:→,precedes:←,nbsp:‗
set modelines=5     " Debian likes to disable this
set mousemodel=popup
set pastetoggle=<F2>
"set relativenumber
set scrolloff=1     " Minimal number of screen lines to keep above and below the cursor.
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set sidescrolloff=5
set smartcase       " Case insensitive searches become sensitive with capitals
set smarttab        " sw at the start of the line, sts everywhere else
set spelllang=en_us
set suffixes+=.dvi  " Lower priority in wildcards
set tags+=../tags,../../tags,../../../tags,../../../../tags
set timeoutlen=1200 " A little bit more time for macros
set ttimeoutlen=50  " Make Esc work faster
set virtualedit=block
set visualbell
set wildignore+=*~
set wildmenu
set wildmode=longest:full,full
set winaltkeys=no

syntax on
filetype plugin indent on

""" Mappings
let mapleader = ","
nnoremap          j gj
nnoremap          k gk
map               Y y$
nnoremap <silent> <C-L> :nohls<CR><C-L>
inoremap          <C-C> <Esc>`^
cnoremap          <C-O> <Up>
inoremap          ø <C-O>o
inoremap          <M-o> <C-O>o
inoremap          <C-X><C-@> <C-A>
inoremap          <C-A> <C-O>^
cnoremap          <C-A> <Home>
cnoremap          <C-X><C-A> <C-A>
inoremap          <C-k> <C-O>D
cnoremap          <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
" If at end of a line of spaces, delete back to the previous line. Otherwise, <Left>
inoremap <silent> <C-B> <C-R>=getline('.')=~'^\s*$'&&col('.')>strlen(getline('.'))?"0\<Lt>C-D>\<Lt>Esc>kJs":"\<Lt>Left>"<CR>
cnoremap          <C-B> <Left>
" If at end of line, decrease indent, else <Del>
inoremap <silent> <C-D> <C-R>=col('.')>strlen(getline('.'))?"\<Lt>C-D>":"\<Lt>Del>"<CR>
cnoremap          <C-D> <Del>
" If at end of line, fix indent, else <Right>
inoremap <silent> <C-F> <C-R>=col('.')>strlen(getline('.'))?"\<Lt>C-F>":"\<Lt>Right>"<CR>
inoremap          <C-E> <End>
cnoremap          <C-F> <Right>

" Enable TAB indent and SHIFT-TAB unindent
vnoremap <silent> <TAB> >gv
vnoremap <silent> <S-TAB> <gv
"vnoremap <silent> >> >gv
"vnoremap <silent> << <gv

" Command-T settings need to be loaded before plugins are
let g:CommandTMaxHeight=20

runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundle'))
endif

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif


