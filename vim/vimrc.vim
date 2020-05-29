" Disable Vi-compatibility.
set nocompatible

" Use , as the leader key.
let mapleader=','

" Use Pathogen to manage plugins.
filetype off
silent! runtime bundle/vim-pathogen/autoload/pathogen.vim
silent! call pathogen#infect()
silent! call pathogen#helptags()

" Enable filetype detection.
filetype plugin indent on

" Use UTF-8 encoding.
set encoding=utf-8 nobomb

" Use the OS clipboard by default.
set clipboard=unnamed

" Enable the mouse in all modes.
if has('mouse')
  set mouse=a
endif

" Don't create backups, swapfiles or undofiles.
set nobackup
set noswapfile
set noundofile

" Hide abandoned buffers instead of closing them.
set hidden

" Automatically reload files that have been changed outside of Vim.
set autoread

" Optimize for fast terminal connections.
set ttyfast

" Only redraw the screen when needed.
set lazyredraw

" Don't beep or flash the screen for error messages.
set noerrorbells

" Don't show the intro message when starting Vim.
set shortmess=I

" Keep the cursor in the same column when moving around vertically.
set nostartofline

" Allow backspacing over everything.
set backspace=indent,eol,start

" Enable syntax highlighting.
syntax enable

" Show line numbers.
set number

" Translate tabs to spaces.
set expandtab

" Use 2 spaces for indentation by default.
set tabstop=2 softtabstop=2 shiftwidth=2

" Don't wrap lines by default.
set nowrap

" Open new windows below the current one.
set splitbelow

" Open new windows to the right of the current one.
set splitright

" Start scrolling 3 lines from the horizontal border.
set scrolloff=3

" Ignore case of searches unless the pattern has mixed case.
set ignorecase smartcase

" Always show the status line.
set laststatus=2

function! GitBranchStatusLine()
  let branch = fugitive#head(7)
  return len(branch) > 0 ? printf(' (%s) ', branch) : ' '
endfunction

" Show the current file path, Git branch, line number and column number on the
" status line.
set statusline=%f%{GitBranchStatusLine()}%=L:\ %l/%L\ C:\ %c

" Show invisible characters unless in INSERT mode.
set list listchars=trail:·,tab:›·
autocmd InsertEnter * setlocal nolist
autocmd InsertLeave * setlocal list

" Highlight the current line in the active window.
autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Use space as the vertical split character.
set fillchars+=vert:\ 

" Keyboard mappings for sensible window switching.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Enable 24-bit color support.
set termguicolors

" Hide ~ characters at the end of buffers (only works in Vim 8.0 or later).
autocmd ColorScheme * silent! highlight EndOfBuffer ctermfg=bg ctermbg=bg guibg=bg guifg=bg

" Use consistent highlighting.
autocmd ColorScheme * silent! highlight LineNr ctermbg=bg guibg=bg
autocmd ColorScheme * silent! highlight SignColumn ctermbg=bg guibg=bg
autocmd ColorScheme * silent! highlight clear Error
autocmd ColorScheme * silent! highlight link Error ErrorMsg
autocmd ColorScheme * silent! highlight clear Todo
autocmd ColorScheme * silent! highlight link Todo Label

" Use a nice color scheme.
colorscheme base16-ocean

" Automatically open NERDTree when Vim starts up if no file was specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Keyboard mapping for quickly toggling NERDTree.
nnoremap <Leader>nt :NERDTreeToggle<CR>

" Show hidden files in NERDTree.
let NERDTreeShowHidden=1

" Minimize visual clutter in NERDTree.
let NERDTreeMinimalUI=1

" Use ~ and + to indicate expanded/collapsed directories in NERDTree.
let NERDTreeDirArrowExpandable='+'
let NERDTreeDirArrowCollapsible='~'

" Open and close NERDTree directories with a single click.
let NERDTreeMouseMode=2

" Set a comfortable window size for NERDTree.
let NERDTreeWinSize=36

" Open Vim help vertically with :vhelp and :vh.
cabbrev vhelp vert help
cabbrev vh vert help

" Open terminal windows vertically with :vterm and :vt.
cabbrev vterm vert term
cabbrev vt vert term

" Display all syntax checking errors in the Syntastic error window.
let g:syntastic_always_populate_loc_list=1

" Automatically open and close the Syntastic error window.
let g:syntastic_auto_loc_list=1

" Run syntax checkers when opening and saving files.
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" Use ESLint for JavaScript syntax checking.
let g:syntastic_javascript_checkers=['eslint']

" Use consistent gutter indicators for syntax checking errors and warnings.
let g:syntastic_error_symbol="\u25cf"
let g:syntastic_style_error_symbol="\u25cf"
let g:syntastic_warning_symbol="\u25cf"
let g:syntastic_style_warning_symbol="\u25cf"

" Load local settings from ~/.vimrc.local.
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
