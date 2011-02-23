" Vim color scheme
" Name: risto.vim
" Author: Christopher Sexton
" Distributable under the same terms as Vim itself (see :help license)
"
" Suggested terminal colors
"
"           Colors      Bright Colors
" Black     #000000     #686868
" Red       #C0190D     #FD7B1C
" Green     #27C11C     #6BF86D
" Yellow    #F5D127     #FFDE58
" Blue      #50B6B7     #6876FC
" Magenta   #A56FFC     #FB7AFD
" Cyan      #14C5C6     #6BFDFE
" White     #C7C7C7     #FFFFFF

hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name = "risto"

if has("gui_running")
    set background=dark
else
    if has("win32") || has("win64")
        set t_Co=16
    elseif $TERM_PROGRAM == 'Apple_Terminal'
        set t_Co=16
    elseif $TERM_PROGRAM == 'iTerm.app'
        set t_Co=256
    elseif has("mac")
        set t_Co=16
    elseif &term == "xterm-256color"
        set t_Co=256
    elseif &term == "xterm-color"
        set t_Co=256
    elseif &term == "xterm"
        set t_Co=256
    else
        set t_Co=16
    end
endif

if (has("gui_running"))
  " GUI
  highlight Normal             guifg=#EEEEEE      guibg=#111111
  highlight Comment            guifg=#AA66FF
  "highlight Comment            guifg=#7C7C7C
  highlight Constant           guifg=#339999
  "highlight Constant           guifg=#BDD6E9
  highlight Cursor             guifg=Black        guibg=White       gui=NONE
  highlight CursorColumn       guifg=NONE         guibg=#333333
  highlight CursorLine         guifg=NONE         guibg=#333333
  highlight Directory          none
  highlight ErrorMsg           guifg=Red          guibg=Black
  highlight FoldColumn         none
  highlight Folded             guifg=DarkGrey     guibg=#1a1a1a
  "highlight Identifier         guifg=#FFCC00
  highlight Identifier         guifg=#FFF15B
  highlight IncSearch          guifg=Black        guibg=Yellow1      gui=none
  highlight Keyword            guifg=#FF6600
  highlight LineNr             guifg=#333333      guibg=Black
  highlight MatchParen         guibg=#135B00      guifg=#85EB6A
  highlight MoreMsg            guifg=#00AA00
  highlight NonText            guifg=#404040
  highlight Pmenu              guifg=White        guibg=#004000      gui=bold
  highlight PmenuSbar          guibg=#5555ff
  highlight PmenuSel           guifg=White        guibg=#48A048      gui=bold
  highlight PmenuThumb         guibg=White
  highlight PreProc            guifg=#AAFFFF
  highlight Question           none
  highlight Regexp             guifg=#44B4CC
  highlight Search             guifg=Black        guibg=Yellow1
  highlight SignColumn         guifg=#AAAA77      guibg=#111111
  highlight Special            guifg=#33AA00
  highlight SpecialKey         guifg=#202020
  highlight Statement          guifg=#FF6600                        gui=none
  highlight StatusLine         guibg=#333333      guifg=#34D800     gui=none
  highlight StatusLineNC       guibg=#333333      guifg=#A8A8A8     gui=none
  highlight String             guifg=#66FF00
  highlight TabLine            guifg=#BBBBBB      guibg=#333333
  highlight TabLineFill        guifg=#BBBBBB      guibg=#808080
  highlight TabLineSel         guibg=Black        guifg=White
  highlight Title              guifg=Magenta
  "highlight Type               guifg=#EEFFA3                        gui=none
  "highlight Type               guifg=#cccccc
  highlight Type               guifg=#FFDE58                        gui=none
  highlight VertSplit          guibg=#333333      guifg=#333333     gui=none
  "highlight Visual             guibg=#FFF15B      guifg=#111111
  highlight Visual             guifg=NONE        guibg=#555555      gui=NONE
  highlight WarningMsg         guifg=Red
  highlight WildMenu           guifg=Black        guibg=#FFFF00     gui=bold
  highlight rubyMethod         guifg=#FF9900
  highlight railsUserClass     guifg=#AAAAAA
  highlight rubyNumber         guifg=#CCFF33
  highlight railsUserMethod    guifg=#AACCFF
  highlight railsMethod        guifg=#FF5500                        gui=bold
"elseif ( &t_Co > 255 )
else
  " cterm 16
  highlight Comment            ctermfg=DarkMagenta
  highlight MatchParen         ctermfg=Black       ctermbg=1
  highlight Constant           ctermfg=Cyan                          cterm=none
  highlight Cursor             ctermfg=Black       ctermbg=White
  highlight CursorColumn       ctermfg=White       ctermbg=8
  highlight CursorLine         ctermfg=White       ctermbg=8         cterm=none
  highlight Directory          none
  highlight ErrorMsg           ctermfg=NONE        ctermbg=Red
  highlight FoldColumn         none
  highlight Folded             ctermfg=DarkGrey    ctermbg=Black
  highlight Identifier         ctermfg=Grey                          cterm=none
  highlight IncSearch          ctermfg=Black       ctermbg=3         cterm=none
  highlight Keyword            ctermfg=Yellow
  highlight LineNr             ctermfg=DarkGrey    ctermbg=Black
  highlight MoreMsg            ctermfg=Green
  highlight NonText            ctermfg=DarkGrey
  highlight Pmenu              ctermfg=White       ctermbg=DarkGreen cterm=none
  highlight PmenuSbar          ctermfg=Black       ctermbg=Green
  highlight PmenuSel           ctermfg=Black       ctermbg=LightGreen cterm=none
  highlight PmenuThumb         ctermbg=Blue
  highlight PreProc            ctermfg=DarkCyan                      cterm=none
  highlight Question           ctermfg=Red
  highlight Regexp             ctermfg=Cyan
  highlight Search             ctermfg=Black       ctermbg=3          cterm=none
  highlight SignColumn         ctermfg=Yellow      ctermbg=Black
  highlight Special            ctermfg=Green
  highlight SpecialKey         ctermfg=DarkGrey
  highlight SpellBad           ctermbg=none        ctermfg=Red       cterm=underline
  highlight SpellLocal         ctermbg=none        ctermfg=1         cterm=underline
  highlight Statement          ctermfg=DarkRed                       cterm=none
  highlight StatusLine         ctermfg=White       ctermbg=DarkGrey  cterm=none
  highlight StatusLineNC       ctermfg=Black       ctermbg=DarkGrey  cterm=none
  highlight String             ctermfg=LightGreen                    cterm=none
  highlight TabLineFill        none
  highlight TabLineSel         ctermfg=White       ctermbg=Black
  highlight Title              ctermfg=Magenta
  highlight Type               ctermfg=Yellow
  highlight VertSplit          ctermbg=DarkGrey    ctermfg=Black     cterm=none
  highlight Visual             ctermbg=DarkGreen   ctermfg=White     cterm=none
  highlight WarningMsg         ctermfg=Red
  highlight WildMenu           ctermfg=Black       ctermbg=Yellow    cterm=none
endif

" For the showmark plugin
" http://www.vim.org/scripts/script.php?script_id=152
" Highlighting: Setup some nice colours to show the mark positions.
highlight default ShowMarksHLl guifg=#AAAA77 guibg=#111111 gui=bold ctermfg=DarkGrey ctermbg=Black
highlight default ShowMarksHLu guifg=#AAAA77 guibg=#111111 gui=bold ctermfg=DarkGrey ctermbg=Black
highlight default ShowMarksHLo guifg=#AAAA77 guibg=#111111 gui=bold ctermfg=DarkGrey ctermbg=Black
highlight default ShowMarksHLm guifg=#AAAA77 guibg=#111111 gui=bold ctermfg=DarkGrey ctermbg=Black

" For the project plugin
highlight projectText          guifg=#CECE9A guibg=Black   gui=bold ctermfg=DarkGrey ctermbg=Black
highlight projectError         guifg=DarkRed guibg=Black   gui=bold ctermfg=DarkRed  ctermbg=Black
highlight projectFoldText      guifg=Blue    guibg=Black   gui=bold ctermfg=DarkGrey ctermbg=Black

" For the VimOutliner plugin
highlight OL1 ctermfg=15 guifg=white
highlight OL2 ctermfg=12 guifg=DarkViolet
highlight OL3 ctermfg=9  guifg=lightblue
highlight OL4 ctermfg=13 guifg=darkviolet
highlight OL5 ctermfg=15 guifg=white

" htmlBoldUnderline
" htmlBoldItalic
" htmlBold
" htmlBoldUnderlineItalic
" htmlBoldItalicUnderline
" htmlUnderlineBold
" htmlUnderlineItalic
" htmlUnderline
" htmlUnderlineBoldItalic
" htmlUnderlineItalicBold
" htmlItalicBold
" htmlItalicUnderline
" htmlItalic
" htmlItalicBoldUnderline
" htmlItalicUnderlineBold
" htmlH1
" htmlH2
" htmlH3
" htmlH4
" htmlH5
" htmlH6

" Links
high link Directory              Constant
high link FoldColumn             Folded
high link Question               MoreMsg
high link railsMethod            PreProc
high link rubyDefine             Keyword
high link rubySymbol             Constant
high link rubyAccess             rubyMethod
high link rubyAttribute          rubyMethod
high link rubyEval               rubyMethod
high link rubyException          rubyMethod
high link rubyInclude            rubyMethod
high link rubyStringDelimiter    Special
high link rubyRegexp             Regexp
high link rubyRegexpDelimiter    rubyRegexp
high link rubyInterpolationDelimiter Special
"high link rubyConstant          Variable
"high link rubyGlobalVariable    Variable
"high link rubyClassVariable     Variable
"high link rubyInstanceVariable  Variable
high link javascriptRegexpString Regexp
high link javascriptNumber       Number
high link javascriptNull         Constant
high link projectDescription     projectText
high link projectWhiteError      projectError
high link projectDescriptionDir  projectText
high link projectDirectory       projectText
high link projectScriptinout     projectText
high link projectComment         projectText
high link projectCD              projectText
high link projectFilterError     projectError
high link projectFilter          projectText
high link projectFilterRegexp    projectText
high link projectFilterEntry     projectText
high link projectFlags           projectText
high link projectFlagsEntry      projectText
high link projectFlagsValues     projectText
high link projectFlagsError      projectError
high link markdownCodeBlock      String


high NERDTree guifg=DarkGrey ctermfg=DarkGrey
"high link NERDTreeFlag
high link NERDTreeUp              NERDTree
high link NERDTreeClosable        NERDTree
high link NERDTreeOpenable        NERDTree
high link NERDTreePart            NERDTree
high link NERDTreePartFile        NERDTree
high link NERDTreeHelpKey         NERDTree
high link NERDTreeHelpTitle       Type
"high link NERDTreeToggleOn
"high link NERDTreeToggleOff
high link NERDTreeHelpCommand     String
high link NERDTreeHelp            Comment
"high link NERDTreeBookmark
"high link NERDTreeRO
high link NERDTreeDirSlash        NERDTree
"high link NERDTreeLink
"high link NERDTreeDir             Constant
high link NERDTreeExecFile        Keyword
high link NERDTreeFile            Normal
high link NERDTreeCWD             Constant
"high link NERDTreeBookmarksLeader
"high link NERDTreeBookmarksHeader
"high link NERDTreeBookmarkName
"high link NERDTreeCurrentNode

high link bufExplorerSortBy       Comment
high link bufExplorerMapping      String
high link bufExplorerTitle        String
high link bufExplorerSortType     bufExplorerSortBy
high link bufExplorerToggleSplit  bufExplorerSplit
high link bufExplorerToggleOpen   bufExplorerOpenIn
high link bufExplorerHelp         Comment
high link bufExplorerOpenIn       Normal
high link bufExplorerSplit        NonText
high link bufExplorerBufNbr       Number
high link bufExplorerModBuf       Exception
high link bufExplorerLockedBuf    Special
high link bufExplorerHidBuf       Constant
high link bufExplorerActBuf       Identifier
high link bufExplorerCurBuf       Type
high link bufExplorerAltBuf       String
high link bufExplorerUnlBuf       Comment


"if !has("gui_mac")
"  " Mac GUI degrades italics to ugly underlining.
"  highlight Comment gui=NONE
"  highlight railsUserClass  gui=NONE
"  highlight railsUserMethod gui=NONE
"  highlight StatusLine gui=NONE
"endif

