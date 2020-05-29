" Hide the toolbar and menu bar.
set guioptions-=T
set guioptions-=m

" Hide scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=b

" Disable GUI tabs.
set guioptions-=e

" Maximize the application window on startup.
set lines=999 columns=999

" Use a sensible default font.
set guifont=Fira\ Code:h14

" Don't blink the cursor in NORMAL mode.
set guicursor=n:blinkon0

" Load local settings from ~/.gvimrc.local.
if filereadable(expand('~/.gvimrc.local'))
  source ~/.gvimrc.local
endif
