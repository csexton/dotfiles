set background=dark
highlight clear
if exists("syntax on")
 syntax reset
endif
let g:colors_name="spacemanspiff"

highlight Normal guifg=#c5c8c6 guibg=#1d1f21 ctermfg=7 ctermbg=NONE
highlight LineNr guifg=#373b41 guibg=NONE ctermfg=0 ctermbg=NONE
highlight NonText guifg=#373b41 guibg=NONE ctermfg=0 ctermbg=NONE
highlight SpecialKey guifg=#373b41 guibg=NONE ctermfg=0 ctermbg=NONE
highlight Search guifg=#1d1f21 guibg=#f0c674 ctermfg=16 ctermbg=3
highlight TabLine guifg=#c5c8c6 guibg=#1d1f21 gui=reverse ctermfg=7 ctermbg=16 cterm=reverse
highlight StatusLine guifg=#c5c8c6 guibg=#4d5057 gui=NONE ctermfg=7 ctermbg=240 cterm=NONE
highlight StatusLineNC guifg=#1d1f21 guibg=#4d5057 gui=NONE ctermfg=16 ctermbg=240 cterm=NONE
highlight VertSplit guifg=#4d5057 guibg=#4d5057 gui=NONE ctermfg=240 ctermbg=240 cterm=NONE
highlight Visual guifg=NONE guibg=#373b41 ctermfg=NONE ctermbg=0
highlight Directory guifg=#81a2be guibg=NONE ctermfg=4 ctermbg=NONE
highlight ModeMsg guifg=#b5bd68 guibg=NONE ctermfg=2 ctermbg=NONE
highlight MoreMsg guifg=#b5bd68 guibg=NONE ctermfg=2 ctermbg=NONE
highlight Question guifg=#b5bd68 guibg=NONE ctermfg=2 ctermbg=NONE
highlight WarningMsg guifg=#cc6666 guibg=NONE ctermfg=1 ctermbg=NONE
highlight MatchParen guifg=NONE guibg=#373b41 ctermfg=NONE ctermbg=0
highlight Folded guifg=#969896 guibg=#1d1f21 ctermfg=245 ctermbg=16
highlight FoldColumn guifg=NONE guibg=#1d1f21 ctermfg=NONE ctermbg=16
highlight CursorLine guifg=NONE guibg=#282a2e gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
highlight CursorColumn guifg=NONE guibg=#282a2e gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
highlight PMenu guifg=#c5c8c6 guibg=#373b41 gui=NONE ctermfg=7 ctermbg=0 cterm=NONE
highlight PMenuSel guifg=#c5c8c6 guibg=#373b41 gui=reverse ctermfg=7 ctermbg=0 cterm=reverse
highlight ColorColumn guifg=NONE guibg=#282a2e gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
highlight Comment guifg=#969896 guibg=NONE ctermfg=245 ctermbg=NONE
highlight Todo guifg=#969896 guibg=#1d1f21 ctermfg=245 ctermbg=16
highlight Title guifg=#969896 guibg=NONE ctermfg=245 ctermbg=NONE
highlight Identifier guifg=#cc6666 guibg=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
highlight Statement guifg=#c5c8c6 guibg=NONE ctermfg=7 ctermbg=NONE
highlight Conditional guifg=#c5c8c6 guibg=NONE ctermfg=7 ctermbg=NONE
highlight Repeat guifg=#c5c8c6 guibg=NONE ctermfg=7 ctermbg=NONE
highlight Structure guifg=#b294bb guibg=NONE ctermfg=5 ctermbg=NONE
highlight Function guifg=#81a2be guibg=NONE ctermfg=4 ctermbg=NONE
highlight Constant guifg=#de935f guibg=NONE ctermfg=3 ctermbg=NONE
highlight String guifg=#b5bd68 guibg=NONE ctermfg=2 ctermbg=NONE
highlight Special guifg=#c5c8c6 guibg=NONE ctermfg=7 ctermbg=NONE
highlight PreProc guifg=#b294bb guibg=NONE ctermfg=5 ctermbg=NONE
highlight Operator guifg=#8abeb7 guibg=NONE gui=NONE ctermfg=6 ctermbg=NONE cterm=NONE
highlight Type guifg=#81a2be guibg=NONE gui=NONE ctermfg=4 ctermbg=NONE cterm=NONE
highlight Define guifg=#b294bb guibg=NONE gui=NONE ctermfg=5 ctermbg=NONE cterm=NONE
highlight Include guifg=#81a2be guibg=NONE ctermfg=4 ctermbg=NONE
highlight vimCommand guifg=#cc6666 guibg=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
highlight cType guifg=#f0c674 guibg=NONE ctermfg=3 ctermbg=NONE
highlight cStorageClass guifg=#b294bb guibg=NONE ctermfg=5 ctermbg=NONE
highlight cConditional guifg=#b294bb guibg=NONE ctermfg=5 ctermbg=NONE
highlight cRepeat guifg=#b294bb guibg=NONE ctermfg=5 ctermbg=NONE
highlight phpVarSelector guifg=#cc6666 guibg=NONE ctermfg=1 ctermbg=NONE
highlight phpKeyword guifg=#b294bb guibg=NONE ctermfg=5 ctermbg=NONE
highlight phpRepeat guifg=#b294bb guibg=NONE ctermfg=5 ctermbg=NONE
highlight phpConditional guifg=#b294bb guibg=NONE ctermfg=5 ctermbg=NONE
highlight phpStatement guifg=#b294bb guibg=NONE ctermfg=5 ctermbg=NONE
highlight phpMemberSelector guifg=#c5c8c6 guibg=NONE ctermfg=7 ctermbg=NONE
highlight rubySymbol guifg=#b5bd68 guibg=NONE ctermfg=2 ctermbg=NONE
highlight rubyConstant guifg=#f0c674 guibg=NONE ctermfg=3 ctermbg=NONE
highlight rubyAttribute guifg=#81a2be guibg=NONE ctermfg=4 ctermbg=NONE
highlight rubyInclude guifg=#81a2be guibg=NONE ctermfg=4 ctermbg=NONE
highlight rubyLocalVariableOrMethod guifg=#de935f guibg=NONE ctermfg=3 ctermbg=NONE
highlight rubyCurlyBlock guifg=#de935f guibg=NONE ctermfg=3 ctermbg=NONE
highlight rubyStringDelimiter guifg=#b5bd68 guibg=NONE ctermfg=2 ctermbg=NONE
highlight rubyInterpolationDelimiter guifg=#de935f guibg=NONE ctermfg=3 ctermbg=NONE
highlight rubyConditional guifg=#b294bb guibg=NONE ctermfg=5 ctermbg=NONE
highlight rubyRepeat guifg=#b294bb guibg=NONE ctermfg=5 ctermbg=NONE
highlight pythonInclude guifg=#b294bb guibg=NONE ctermfg=5 ctermbg=NONE
highlight pythonStatement guifg=#b294bb guibg=NONE ctermfg=5 ctermbg=NONE
highlight pythonConditional guifg=#b294bb guibg=NONE ctermfg=5 ctermbg=NONE
highlight pythonFunction guifg=#81a2be guibg=NONE ctermfg=4 ctermbg=NONE
highlight javaScriptBraces guifg=#c5c8c6 guibg=NONE ctermfg=7 ctermbg=NONE
highlight javaScriptFunction guifg=#b294bb guibg=NONE ctermfg=5 ctermbg=NONE
highlight javaScriptConditional guifg=#b294bb guibg=NONE ctermfg=5 ctermbg=NONE
highlight javaScriptRepeat guifg=#b294bb guibg=NONE ctermfg=5 ctermbg=NONE
highlight javaScriptNumber guifg=#de935f guibg=NONE ctermfg=3 ctermbg=NONE
highlight javaScriptMember guifg=#de935f guibg=NONE ctermfg=3 ctermbg=NONE
highlight diffAdded guifg=#b5bd68 guibg=NONE ctermfg=2 ctermbg=NONE
highlight diffRemoved guifg=#cc6666 guibg=NONE ctermfg=1 ctermbg=NONE

highlight link character constant
highlight link number constant
highlight link boolean constant
highlight link Float Number
highlight link Conditional Repeat
highlight link Label Statement
highlight link Keyword Statement
highlight link Exception Statement
highlight link Include PreProc
highlight link Define PreProc
highlight link Macro PreProc
highlight link PreCondit PreProc
highlight link StorageClass Type
highlight link Structure Type
highlight link Typedef Type
highlight link htmlTag Special
highlight link Tag Special
highlight link SpecialChar Special
highlight link Delimiter Special
highlight link SpecialComment Special
highlight link Debug Special
highlight htmlItalic cterm=none
highlight PmenuSel ctermbg=black
