set nocompatible

" See also my VimASIDE_Notes:
"  From https://github.com/tpope/vim-pathogen
" And Vim: revisited
" http://mislav.uniqpath.com/2011/12/vim-revisited/
execute pathogen#infect()
syntax on
set showcmd                     " display incomplete commands
filetype plugin indent on	" load file type plugins + indentation

set omnifunc=syntaxcomplete#Complete

"" Leader key and edit this file (.vimrc)
let mapleader=","

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Display the cursor position on the last line of the screen or in the status
" line of a window
" set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2



"" wrap lines but do not insert linebreaks
"" see http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0

"" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Buffer switching
nnoremap <leader><leader> <c-^> " switch buffer

"" Spell Checking
:set spell spelllang=en_us


"" MARKDOWN
"" present MD as markdown files: see http://robinlovelace.net/computing/2013/10/31/vim-for-markdown.html
au BufRead,BufNewFile *.md.* set filetype=markdown


