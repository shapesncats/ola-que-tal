" Ola que tal
" Description: Light, almost off, colorscheme for vim.
" Author: A. Aguilar <a.aguilar@ciencias.unam.mx>
" Source: https://github.com/shapesncats/ola-que-tal
" Last Revision: August 3 2018

" Setup:
" Init: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name="ola-que-tal"

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Colour Palette: {{{

" Background
let s:bg = '#fefef5'

" Mains/normals

let s:n1 = '#8A6584'
let s:n2 = '#B49DB0'
let s:n3 = '#D4C7D2' " Main fg
let s:n4 = '#E9E3E8'
let s:n5 = '#F4F1F3'

" Helping Silvers
let s:s1 = '#B1B0BE'
let s:s2 = '#C7C6D0'
let s:s3 = '#DDDDE3'
let s:s4 = '#F3F3F5'


let s:watermelon = '#FE7F9c'
let s:salmon = '#FCA3B7'
let s:sunsetred = '#F7CAC1'
let s:nailpolish = '#B284BE'
let s:lipstick = '#FE7F9C'
let s:lips = '#E3759B'

let s:ayeblue = '#A1ACD0'
let s:blondegreen = '#9EC0A3'


" }}}
" Emphasis: {{{

let s:bold = 'bold,'
let s:italic = 'italic,'
let s:underline = 'underline,'
let s:undecrurl = 'undercurl,'
let s:inverse = 'inverse,'
let s:none = 'NONE'

" }}}
" HL Function: {{{

function! s:HL(group, fg, ...)

  " fg

  let fg = a:fg

  " bg

  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emph

  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  let histring = ['hi', a:group,
        \ 'guifg=' . fg,
        \ 'guibg=' . bg,
        \ 'gui=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3)
  endif

  execute join(histring, ' ')
endfunction

" }}}
" Helper Groups: {{{

call s:HL('OlaNormal', s:n1)
call s:HL('OlaNormalBold', s:n1, s:none, s:bold)
call s:HL('OlaPink', s:salmon)
call s:HL('OlaPinkBold', s:salmon, s:none, s:bold)
call s:HL('OlaHotPink', s:watermelon)
call s:HL('OlaHotPinkBold', s:watermelon, s:none, s:bold)
call s:HL('OlaPBrown', s:nailpolish)
call s:HL('OlaPBrownBold', s:nailpolish, s:none, s:bold)
call s:HL('OlaPaleGold', s:lips)
call s:HL('OlaPaleGoldBold', s:lips, s:none, s:bold)
call s:HL('OlaOrange', s:blondegreen)
call s:HL('OlaOrangeBold', s:blondegreen, s:none, s:bold)
call s:HL('OlaCool', s:ayeblue)
call s:HL('OlaCoolBold', s:ayeblue, s:none, s:bold)


" }}}


" Colours:
" UI: {{{

call s:HL('Normal', s:n1, s:bg)

if version >= 700
  call s:HL('CursorLine', s:none, s:none)
  hi! link CursorColumn CursorLine

  call s:HL('TablineFill', s:n2, s:none)
  call s:HL('TabLineSel', s:n2, s:none, s:italic . s:bold)
  call s:HL('TabLine', s:n3, s:bg)

  call s:HL('MatchParen', s:s3, s:none, s:bold . s:inverse)
endif

if version >= 703
  call s:HL('ColorColumn', s:n1, s:watermelon)
  call s:HL('Conceal', s:n1, s:none)
  call s:HL('CursorLineNr', s:n1, s:none, s:bold . s:underline)
endif

call s:HL('NonText', s:bg, s:none)
call s:HL('SpecialKey', s:bg, s:none)


call s:HL('Visual', s:salmon, s:none, s:inverse)
hi! link VisualNOS Visual

call s:HL('Search', s:n1, s:none, s:underline)
hi! link IncSearch Visual


call s:HL('Underlined', s:n1, s:none, s:underline)

call s:HL('StatusLine', s:watermelon, s:none, s:inverse)
call s:HL('StatusLineNC', s:none)

call s:HL('VertSplit', s:s2, s:none)

call s:HL('WildMenu', s:n1, s:none, s:inverse)

call s:HL('Directory', s:nailpolish)

call s:HL('Title', s:n1, s:none, s:bold)

call s:HL('ErrorMsg', s:watermelon, s:bg, s:inverse)
call s:HL('MoreMsg', s:n1, s:bold)
call s:HL('ModeMsg', s:blondegreen, s:none, s:bold)
call s:HL('Question', s:watermelon, s:none, s:italic)
call s:HL('WarningMsg', s:none, s:salmon)

call s:HL('Folded', s:s1, s:none)
hi! link FoldColumn Folded

" }}}
" Gutter: {{{

call s:HL('LineNr', s:s1, s:none)
call s:HL('SignColumn', s:s1, s:none)

" }}}
" Cursor: {{{

call s:HL('Cursor', s:none, s:none, s:inverse)
hi! link vCursor Cursor
hi! link iCursor Cursor
hi! link lCursor Cursor

" }}}
" Completion Menu: {{{

if version >= 700
  call s:HL('Pmenu', s:n3, s:s4)
  call s:HL('PmenuSel', s:n3, s:s4, s:bold)
  call s:HL('PmenuSbar', s:none, s:s4)
  call s:HL('PmenuThumb', s:none, s:s4, s:inverse)
endif

" }}}
" Spelling: {{{



" }}}
" Syntax Highlighting {{{

call s:HL('Special', s:watermelon)
call s:HL('Comment', s:n2)
call s:HL('Todo', s:n1)

call s:HL('Error', s:watermelon, s:none, s:inverse)

hi! link Statement OlaNormalBold
hi! link Conditional OlaPink
hi! link Repeat OlaPink
hi! link Label OlaPink
hi! link Exception OlaHotPinkBold

hi! link Operator OlaNormalBold
hi! link Identifier OlaPBrown
call s:HL('Function', s:n3)
hi! link PreProc OlaPaleGold
hi! link Include OlaPBrownBold
hi! link Define OlaHotPinkBold
hi! link Macro OlaHotPinkBold
hi! link PreCondit OlaPBrownBold

hi! link Constant OlaPBrown
hi! link Character OlaPBrown

call s:HL('String', s:s2)

hi! link Boolean OlaPaleGold
hi! link Number OlaPaleGold
hi! link Float OlaPaleGold
hi! link Type OlaPBrown
hi! link StorageClass OlaOrangeBold
hi! link Structure OlaNormalBold
hi! link Typedef OlaPaleGoldBold

call s:HL('Keyword', s:salmon)

" }}}

" Plugin Support:
" Sybil {{{

call s:HL('SybilFunction', s:n2)
call s:HL('SybilExtSymb', s:n1, s:none, s:italic)
call s:HL('SybilExtFunSymb', s:n2, s:none, s:italic)
call s:HL('SybilFunName', s:nailpolish, s:none, s:italic)


call s:HL('SybilDefSymb', s:lips)
hi! link SybilExtDefSymb OLispDefSymb

call s:HL('SybilLLI', s:lipstick)
call s:HL('SybilWSymb', s:blondegreen)
hi! link SybilExtWSymb OLispWSymb

hi! link SybilTodo Todo

hi! link SybilComment Comment
hi! link SybilKey Keyword
hi! link SybilString String


" }}}
" EasyMotion: {{{

call s:HL('EasyMotionTarget2First', s:n1, s:none, s:underline . s:bold)
call s:HL('EasyMotionTarget2Second', s:n2, s:none)
hi! link EasyMotionTarget EasyMotionTarget2First
call s:HL('EasyMotionShade', s:s3)

" }}}
" Signature: {{{

call s:HL('SignatureMarkText', s:ayeblue, s:none)
call s:HL('SignatureMarkerText', s:watermelon, s:none, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket Normal
call s:HL('StartifyPath', s:s2)
hi! link StartifyFile Normal
call s:HL('StartifyNumber', s:salmon)
call s:HL('StartifySlash', s:n1)
call s:HL('StartifySection', s:watermelon)
call s:HL('StartifySpecial', s:nailpolish, s:none, s:italic)
call s:HL('StartifyHeader', s:n2)
call s:HL('StartifyFooter', s:n2)

" }}}
" Signify: {{{

call s:HL('SignifySignAdd', s:n2, s:none)
call s:HL('SignifySignChange', s:n2, s:none)
call s:HL('SignifySignDelete', s:watermelon, s:none)

" }}}

" Filetypes:
" Html: {{{

call s:HL('htmlTag', s:n3)
call s:HL('htmlEndTag', s:n3)
call s:HL('htmlScriptTag', s:n3)

call s:HL('htmlTagName', s:n2)
call s:HL('htmlArg', s:n3, s:none, s:italic)

call s:HL('htmlTagN', s:watermelon)
call s:HL('SpecialTagName', s:salmon)

call s:HL('htmlLink', s:n2, s:none, s:underline)
call s:HL('htmlSpecialChar', s:salmon)

call s:HL('htmlBold', s:n1, s:none, s:bold)
call s:HL('htmlBoldUnderline', s:n1, s:none, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:n1, s:none, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:n1, s:none, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:n1, s:none, s:underline)
call s:HL('htmlUnderlineItalic', s:n1, s:none, s:underline . s:italic)

call s:HL('htmlItalic', s:n1, s:none, s:italic)

" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:n2, s:none, s:bold)

hi! link vimNotation Normal
hi! link vimBracket Normal
hi! link vimMapModKey OlaOrange
hi! link vimFuncSID Normal
hi! link vimSetSep Normal
hi! link vimSep Normal
hi! link vimContinue Normal

" }}}
" JavaScript: {{{

hi! link javaScriptBraces OlaNormal
call s:HL('javaScriptFunction', s:watermelon)
hi! link javaScriptIdentifier OlaHotPink
hi! link javaScriptMember OlaPink
hi! link javaScriptNumber OlaOrange
hi! link javaScriptNull OlaCool
hi! link javaScripParens OlaNormal

" }}}
" Go: {{{

hi! link goStatement OlaCool
hi! link goConditional OlaPink
hi! link goLabel Keyword
call s:HL('goRepeat', s:sunsetred)

call s:HL('goType', s:n2)
hi! link goSignedInts goType
hi! link goUnsignedInts goType
hi! link goFloats goType
hi! link goComplexes goType
hi! link goDecimalInt goType
hi! link goHexadecimalInt goType
hi! link goOctalint goType
hi! link goOctalError goType
hi! link goFloat goType
hi! link goImaginary goType
hi! link goExtraType goType

hi! link goTodo OlaNormalBold
hi! link goComment Comment

call s:HL('goEscapeOctal', s:s2)
hi! link goEscapeC goEscapeOctal
hi! link goEscapeX goEscapeOctal
hi! link goEscape UgoEscapeOctal
hi! link goEscapeBigU goEscapeOctal

call s:HL('goEscapeError', s:salmon)
hi! link goSpaceError goEscapeError

call s:HL('goSpecialString', s:nailpolish, s:none, s:italic)
call s:HL('goString', s:nailpolish, s:none)
call s:HL('goRawString', s:s2, s:none, s:italic)

hi! link goCharacter goString
hi! link goBlock OlaNormalBold
hi! link goParen Normal

" }}}
"
" vim: set fdm=marker:
