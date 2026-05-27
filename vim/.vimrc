set nocompatible
set encoding=utf-8

let g:mapleader=' '
let g:localmapleader=' '

set mouse=a

set noundofile

set list listchars=eol:\ ,trail:\·,tab:\·\·

set expandtab
set shiftwidth=4 tabstop=4 softtabstop=4

set completeopt=menu,menuone,popup,noinsert

set timeoutlen=300

set fillchars=eob:\ ,vert:\│,stl:\ ,stlnc:\─

set laststatus=2

" Map the current mode to readable name and highlight group to use for the
" status line. See `:help mode()`.
let g:status_line_mode_map={
       \ 'n'        : ['NORMAL', 'StatusLineNormalMode'],
       \ 'no'       : ['NORMAL', 'StatusLineNormalMode'],
       \ 'nov'      : ['NORMAL', 'StatusLineNormalMode'],
       \ 'noV'      : ['NORMAL', 'StatusLineNormalMode'],
       \ "no\<C-V>" : ['NORMAL', 'StatusLineNormalMode'],
       \ "niI"      : ['NORMAL', 'StatusLineNormalMode'],
       \ "niR"      : ['NORMAL', 'StatusLineNormalMode'],
       \ "niV"      : ['NORMAL', 'StatusLineNormalMode'],
       \ "nt"       : ['TERMINAL', 'StatusLineTerminalMode'],
       \ 'v'        : ['VISUAL', 'StatusLineVisualMode'],
       \ 'vs'       : ['V-CHAR', 'StatusLineVisualMode'],
       \ 'V'        : ['V-LINE', 'StatusLineVisualMode'],
       \ 'Vs'       : ['V-LINE', 'StatusLineVisualMode'],
       \ "\<C-V>"   : ['V-BLOCK', 'StatusLineVisualMode'],
       \ "\<C-V>s"  : ['V-BLOCK', 'StatusLineVisualMode'],
       \ 's'        : ['SELECT', 'StatusLineSelectMode'],
       \ 'S'        : ['S-LINE', 'StatusLineSelectMode'],
       \ "\<C-S>"   : ['S-BLOCK', 'StatusLineSelectMode'],
       \ 'i'        : ['INSERT', 'StatusLineInsertMode'],
       \ 'ic'       : ['INSERT', 'StatusLineInsertMode'],
       \ 'ix'       : ['INSERT', 'StatusLineInsertMode'],
       \ 'R'        : ['REPLACE', 'StatusLineReplaceMode'],
       \ 'Rc'       : ['REPLACE', 'StatusLineReplaceMode'],
       \ 'Rx'       : ['REPLACE', 'StatusLineReplaceMode'],
       \ 'Rv'       : ['V-REPLACE', 'StatusLineReplaceMode'],
       \ 'Rvc'      : ['V-REPLACE', 'StatusLineReplaceMode'],
       \ 'Rvx'      : ['V-REPLACE', 'StatusLineReplaceMode'],
       \ 'c'        : ['COMMAND', 'StatusLineCommandMode'],
       \ 'ct'       : ['COMMAND', 'StatusLineCommandMode'],
       \ 'cr'       : ['COMMAND', 'StatusLineCommandMode'],
       \ 'cv'       : ['COMMAND', 'StatusLineCommandMode'],
       \ 'cvr'      : ['COMMAND', 'StatusLineCommandMode'],
       \ 'ce'       : ['COMMAND', 'StatusLineCommandMode'],
       \ 'r'        : ['PROMPT', 'StatusLineConfirmMode'],
       \ 'rm'       : ['MORE', 'StatusLineConfirmMode'],
       \ 'r?'       : ['CONFIRM', 'StatusLineConfirmMode'],
       \ '!'        : ['TERMINAL', 'StatusLineTerminalMode'],
       \ 't'        : ['TERMINAL', 'StatusLineTerminalMode'],
       \ }

function! RenderStatusLine()
    let mode_map = g:status_line_mode_map[mode()]
    let mode_highlight = '%#' . mode_map[1] . '#'
    let status_line = mode_highlight
    let status_line .= ' ' . mode_map[0] . ' '
    let status_line .= '%#StatusLineFilePath# %f '
    let status_line .= '%#StatusLine#%='
    let status_line .= '%#StatusLinePercentage# %p%% '
    let status_line .= mode_highlight
    let status_line .= ' %l:%c '
    return status_line
endfunction

set statusline=%!RenderStatusLine()

autocmd! WinEnter * setlocal statusline=%!RenderStatusLine()
autocmd! WinLeave * setlocal statusline=\─

function! OnQuickFixLoad()
    setlocal statusline=%!RenderStatusLine()
    setlocal nonumber norelativenumber
endfunction

autocmd! BufReadPost quickfix call OnQuickFixLoad()

function! TryChangeGitDirectory()
    let relevant_buftypes = ['', 'nofile', 'nowrite', 'acwrite']
    if index(relevant_buftypes, &buftype) == -1
        return
    endif
    let current_file = expand('%:p')
    let directory = empty(current_file) ? getcwd() : expand('%:p:h')
    while directory != '/'
        if isdirectory(directory . '/.git')
            silent execute 'cd ' . directory
            return
        endif
        let directory = fnamemodify(directory, ':h')
    endwhile
endfunction

autocmd! BufEnter * call TryChangeGitDirectory()

set splitright
set splitbelow

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

autocmd! FileType help :wincmd L

set noautochdir

set noshowmode
set noshowcmd
set noruler

set number relativenumber cursorline
set numberwidth=4
set signcolumn=yes

set scrolloff=4 sidescrolloff=4

set clipboard=unnamed,unnamedplus

set incsearch hlsearch smartcase ignorecase

set path+=**

set wildmenu wildoptions=fuzzy,pum
set pumheight=12 pumwidth=32

if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --glob=!.git/
    set grepformat=%f:%l:%c:%m
    command! -nargs=+ Rg execute 'silent grep! <args>' | redraw! | copen
    noremap <leader>f :Rg 
endif

nnoremap <C-n> <cmd>cn<cr>
nnoremap <C-p> <cmd>cp<cr>

nnoremap <silent> <Esc> <cmd>set nohlsearch<cr>
nnoremap <silent> <Esc><Esc> <cmd>cclose<cr>

set confirm

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

set shortmess+=I

if !has('nvim')
    syntax on
endif

colorscheme ansi
