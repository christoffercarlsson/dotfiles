set background=dark

hi! clear

if exists('syntax_on')
    syntax reset
endif

set notermguicolors

hi! Normal                          ctermbg=NONE    ctermfg=NONE  cterm=NONE
hi! NonText                         ctermbg=NONE    ctermfg=0     cterm=NONE
hi! Comment                         ctermbg=NONE    ctermfg=7     cterm=italic
hi! Constant                        ctermbg=NONE    ctermfg=3     cterm=NONE
hi! Error                           ctermbg=NONE    ctermfg=1     cterm=NONE
hi! Identifier                      ctermbg=NONE    ctermfg=9     cterm=NONE
hi! Function                        ctermbg=NONE    ctermfg=4     cterm=NONE
hi! Special                         ctermbg=NONE    ctermfg=13    cterm=NONE
hi! Statement                       ctermbg=NONE    ctermfg=5     cterm=NONE
hi! String                          ctermbg=NONE    ctermfg=2     cterm=NONE
hi! Operator                        ctermbg=NONE    ctermfg=6     cterm=NONE
hi! Boolean                         ctermbg=NONE    ctermfg=3     cterm=NONE
hi! Label                           ctermbg=NONE    ctermfg=14    cterm=NONE
hi! Keyword                         ctermbg=NONE    ctermfg=5     cterm=NONE
hi! Exception                       ctermbg=NONE    ctermfg=5     cterm=NONE
hi! Conditional                     ctermbg=NONE    ctermfg=5     cterm=NONE
hi! PreProc                         ctermbg=NONE    ctermfg=13    cterm=NONE
hi! Include                         ctermbg=NONE    ctermfg=5     cterm=NONE
hi! Macro                           ctermbg=NONE    ctermfg=5     cterm=NONE
hi! StorageClass                    ctermbg=NONE    ctermfg=11    cterm=NONE
hi! Structure                       ctermbg=NONE    ctermfg=11    cterm=NONE
hi! Todo                            ctermbg=12      ctermfg=0     cterm=bold
hi! Type                            ctermbg=NONE    ctermfg=11    cterm=NONE
hi! Underlined                      ctermbg=NONE    ctermfg=NONE  cterm=underline
hi! Bold                            ctermbg=NONE    ctermfg=NONE  cterm=bold
hi! Italic                          ctermbg=NONE    ctermfg=NONE  cterm=italic
hi! Ignore                          ctermbg=NONE    ctermfg=NONE  cterm=NONE
hi! StatusLine                      ctermbg=0       ctermfg=15    cterm=NONE
hi! VertSplit                       ctermbg=NONE    ctermfg=8     cterm=NONE
hi! TabLine                         ctermbg=0       ctermfg=7     cterm=NONE
hi! TabLineFill                     ctermbg=NONE    ctermfg=0     cterm=NONE
hi! TabLineSel                      ctermbg=11      ctermfg=0     cterm=NONE
hi! Title                           ctermbg=NONE    ctermfg=4     cterm=bold
hi! CursorLine                      ctermbg=NONE    ctermfg=NONE  cterm=NONE
hi! Cursor                          ctermbg=15      ctermfg=0     cterm=NONE
hi! CursorColumn                    ctermbg=0       ctermfg=NONE  cterm=NONE
hi! LineNr                          ctermbg=NONE    ctermfg=8     cterm=NONE
hi! CursorLineNr                    ctermbg=NONE    ctermfg=6     cterm=NONE
hi! helpLeadBlank                   ctermbg=NONE    ctermfg=NONE  cterm=NONE
hi! helpNormal                      ctermbg=NONE    ctermfg=NONE  cterm=NONE
hi! Visual                          ctermbg=8       ctermfg=NONE  cterm=NONE
hi! VisualNOS                       ctermbg=8       ctermfg=NONE  cterm=bold
hi! Pmenu                           ctermbg=0       ctermfg=15    cterm=NONE
hi! PmenuSbar                       ctermbg=0       ctermfg=7     cterm=NONE
hi! PmenuSel                        ctermbg=8       ctermfg=15    cterm=bold
hi! PmenuThumb                      ctermbg=8       ctermfg=NONE  cterm=NONE
hi! FoldColumn                      ctermbg=NONE    ctermfg=7     cterm=NONE
hi! Folded                          ctermbg=NONE    ctermfg=12    cterm=NONE
hi! WildMenu                        ctermbg=0       ctermfg=15    cterm=NONE
hi! SpecialKey                      ctermbg=NONE    ctermfg=0     cterm=NONE
hi! Search                          ctermbg=11      ctermfg=0     cterm=NONE
hi! Directory                       ctermbg=NONE    ctermfg=4     cterm=NONE
hi! MatchParen                      ctermbg=0       ctermfg=3     cterm=bold
hi! SpellBad                        ctermbg=NONE    ctermfg=NONE  cterm=undercurl
hi! SpellCap                        ctermbg=NONE    ctermfg=NONE  cterm=undercurl
hi! SpellLocal                      ctermbg=NONE    ctermfg=NONE  cterm=undercurl
hi! SpellRare                       ctermbg=NONE    ctermfg=NONE  cterm=undercurl
hi! ColorColumn                     ctermbg=8       ctermfg=NONE  cterm=NONE
hi! SignColumn                      ctermbg=NONE    ctermfg=7     cterm=NONE
hi! ModeMsg                         ctermbg=15      ctermfg=0     cterm=bold
hi! MoreMsg                         ctermbg=NONE    ctermfg=4     cterm=NONE
hi! Question                        ctermbg=NONE    ctermfg=4     cterm=NONE
hi! Conceal                         ctermbg=NONE    ctermfg=8     cterm=NONE
hi! ToolbarLine                     ctermbg=0       ctermfg=15    cterm=NONE
hi! ToolbarButton                   ctermbg=8       ctermfg=15    cterm=NONE
hi! debugPC                         ctermbg=NONE    ctermfg=7     cterm=NONE
hi! debugBreakpoint                 ctermbg=NONE    ctermfg=8     cterm=NONE
hi! ErrorMsg                        ctermbg=NONE    ctermfg=1     cterm=bold,italic
hi! WarningMsg                      ctermbg=NONE    ctermfg=11    cterm=NONE
hi! DiffAdd                         ctermbg=10      ctermfg=0     cterm=NONE
hi! DiffChange                      ctermbg=12      ctermfg=0     cterm=NONE
hi! DiffDelete                      ctermbg=9       ctermfg=0     cterm=NONE
hi! DiffText                        ctermbg=14      ctermfg=0     cterm=NONE
hi! diffAdded                       ctermbg=NONE    ctermfg=10    cterm=NONE
hi! diffRemoved                     ctermbg=NONE    ctermfg=9     cterm=NONE
hi! diffChanged                     ctermbg=NONE    ctermfg=12    cterm=NONE
hi! diffOldFile                     ctermbg=NONE    ctermfg=11    cterm=NONE
hi! diffNewFile                     ctermbg=NONE    ctermfg=13    cterm=NONE
hi! diffFile                        ctermbg=NONE    ctermfg=12    cterm=NONE
hi! diffLine                        ctermbg=NONE    ctermfg=7     cterm=NONE
hi! diffIndexLine                   ctermbg=NONE    ctermfg=14    cterm=NONE
hi! healthError                     ctermbg=NONE    ctermfg=1     cterm=NONE
hi! healthSuccess                   ctermbg=NONE    ctermfg=2     cterm=NONE
hi! healthWarning                   ctermbg=NONE    ctermfg=3     cterm=NONE
hi! NormalFloat                     ctermbg=0       ctermfg=15    cterm=NONE
hi! FloatBorder                     ctermbg=0       ctermfg=7     cterm=NONE
hi! FloatShadow                     ctermbg=0       ctermfg=15    cterm=NONE
hi! StatusLineNormalMode            ctermbg=4       ctermfg=0     cterm=NONE
hi! StatusLineInsertMode            ctermbg=5       ctermfg=0     cterm=NONE
hi! StatusLineVisualMode            ctermbg=6       ctermfg=0     cterm=NONE
hi! StatusLineCommandMode           ctermbg=2       ctermfg=0     cterm=NONE
hi! StatusLineReplaceMode           ctermbg=3       ctermfg=0     cterm=NONE
hi! StatusLineFilePath              ctermbg=8       ctermfg=15    cterm=NONE

if has('nvim')
    hi! @variable                   ctermbg=NONE    ctermfg=15    cterm=NONE
    hi! @variable.builtin           ctermbg=NONE    ctermfg=1     cterm=NONE
    hi! @variable.parameter         ctermbg=NONE    ctermfg=1     cterm=NONE
    hi! @variable.member            ctermbg=NONE    ctermfg=1     cterm=NONE
    hi! @constant.builtin           ctermbg=NONE    ctermfg=5     cterm=NONE
    hi! @string.regexp              ctermbg=NONE    ctermfg=1     cterm=NONE
    hi! @string.escape              ctermbg=NONE    ctermfg=6     cterm=NONE
    hi! @string.special.url         ctermbg=NONE    ctermfg=4     cterm=underline
    hi! @string.special.symbol      ctermbg=NONE    ctermfg=13    cterm=NONE
    hi! @type.builtin               ctermbg=NONE    ctermfg=3     cterm=NONE
    hi! @property                   ctermbg=NONE    ctermfg=1     cterm=NONE
    hi! @function.builtin           ctermbg=NONE    ctermfg=5     cterm=NONE
    hi! @constructor                ctermbg=NONE    ctermfg=11    cterm=NONE
    hi! @keyword.function           ctermbg=NONE    ctermfg=5     cterm=NONE
    hi! @keyword.return             ctermbg=NONE    ctermfg=5     cterm=NONE
    hi! @keyword.export             ctermbg=NONE    ctermfg=12    cterm=NONE
    hi! @punctuation.bracket        ctermbg=NONE    ctermfg=15    cterm=NONE
    hi! @comment.error              ctermbg=9       ctermfg=0     cterm=NONE
    hi! @comment.warning            ctermbg=11      ctermfg=0     cterm=NONE
    hi! @comment.todo               ctermbg=12      ctermfg=0     cterm=NONE
    hi! @comment.note               ctermbg=14      ctermfg=0     cterm=NONE
    hi! @markup                     ctermbg=NONE    ctermfg=15    cterm=NONE
    hi! @markup.strong              ctermbg=NONE    ctermfg=15    cterm=bold
    hi! @markup.italic              ctermbg=NONE    ctermfg=15    cterm=italic
    hi! @markup.strikethrough       ctermbg=NONE    ctermfg=15    cterm=strikethrough
    hi! @markup.heading             ctermbg=NONE    ctermfg=4     cterm=bold
    hi! @markup.quote               ctermbg=NONE    ctermfg=6     cterm=NONE
    hi! @markup.math                ctermbg=NONE    ctermfg=4     cterm=NONE
    hi! @markup.link.url            ctermbg=NONE    ctermfg=5     cterm=underline
    hi! @markup.raw                 ctermbg=NONE    ctermfg=14    cterm=NONE
    hi! @markup.list.checked        ctermbg=NONE    ctermfg=2     cterm=NONE
    hi! @markup.list.unchecked      ctermbg=NONE    ctermfg=7     cterm=NONE
    hi! @tag                        ctermbg=NONE    ctermfg=5     cterm=NONE
    hi! @tag.builtin                ctermbg=NONE    ctermfg=6     cterm=NONE
    hi! @tag.attribute              ctermbg=NONE    ctermfg=4     cterm=NONE
    hi! @tag.delimiter              ctermbg=NONE    ctermfg=15    cterm=NONE
endif

hi! link EndOfBuffer                        NonText
hi! link SpecialComment                     Special
hi! link Define                             PreProc
hi! link PreCondit                          PreProc
hi! link Number                             Constant
hi! link Float                              Number
hi! link Typedef                            Type
hi! link SpecialChar                        Special
hi! link Debug                              Special
hi! link StatusLineTerm                     StatusLine
hi! link StatusLineTermNC                   StatusLineNC
hi! link WinSeparator                       VertSplit
hi! link WinBar                             StatusLine
hi! link WinBarNC                           StatusLineNC
hi! link lCursor                            Cursor
hi! link CursorIM                           Cursor
hi! link Terminal                           Normal
hi! link StatusLineTerm                     StatusLine
hi! link StatusLineTermNC                   StatusLineNC
hi! link StatusLinePercentage               StatusLineFilePath
hi! link StatusLineConfirmMode              StatusLineCommandMode
hi! link StatusLineTerminalMode             StatusLineCommandMode
hi! link StatusLineSelectMode               StatusLineVisualMode
hi! link StatusLineNC                       VertSplit
hi! link QuickfixLine                       Visual
hi! link IncSearch                          Search
hi! link CurSearch                          Search

if has('nvim')
    hi! link @variable.parameter.builtin    @variable.parameter
    hi! link @constant                      Constant
    hi! link @constant.macro                Macro
    hi! link @module                        Structure
    hi! link @module.builtin                Special
    hi! link @label                         Label
    hi! link @string                        String
    hi! link @string.special                Special
    hi! link @character                     Character
    hi! link @character.special             SpecialChar
    hi! link @boolean                       Boolean
    hi! link @number                        Number
    hi! link @number.float                  Float
    hi! link @type                          Type
    hi! link @type.definition               Type
    hi! link @attribute                     Constant
    hi! link @attribute.builtin             Constant
    hi! link @function                      Function
    hi! link @function.call                 Function
    hi! link @function.method               Function
    hi! link @function.method.call          Function
    hi! link @operator                      Operator
    hi! link @keyword                       Keyword
    hi! link @keyword.coroutine             Keyword
    hi! link @keyword.operator              Operator
    hi! link @keyword.import                Include
    hi! link @keyword.type                  Keyword
    hi! link @keyword.modifier              Keyword
    hi! link @keyword.repeat                Repeat
    hi! link @keyword.debug                 Exception
    hi! link @keyword.exception             Exception
    hi! link @keyword.conditional           Conditional
    hi! link @keyword.conditional.ternary   Operator
    hi! link @keyword.directive             PreProc
    hi! link @keyword.directive.define      Define
    hi! link @punctuation.delimiter         Delimiter
    hi! link @punctuation.special           Special
    hi! link @comment                       Comment
    hi! link @comment.documentation         Comment
    hi! link @markup.underline              underline
    hi! link @markup.link                   Tag
    hi! link @markup.link.label             Label
    hi! link @markup.list                   Special
    hi! link @diff.plus                     diffAdded
    hi! link @diff.minus                    diffRemoved
    hi! link @diff.delta                    diffChanged
endif
