scriptencoding utf-8
set encoding=utf-8
set nocompatible

" See also my VimASIDE_Notes:
"  From https://github.com/tpope/vim-pathogen
" And Vim: revisited
" http://mislav.uniqpath.com/2011/12/vim-revisited/
"
" Parts derived from https://github.com/joshdmiller/vim/blob/master/vim/lib/environment.vim
"
execute pathogen#infect()
execute pathogen#infect('~/.vim/bundle-forked/{}')
execute pathogen#helptags()  
" if this is too slow use :Helptags in vim
syntax on
set showcmd                     " display incomplete commands
filetype plugin indent on	" load file type plugins + indentation

set omnifunc=syntaxcomplete#Complete

"" Leader key and edit this file (.vimrc)
let mapleader=","

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
else
    set t_Co=256
endif

"------------------------------------------------------------------------------
" Custom color scheme
"------------------------------------------------------------------------------
try
    colorscheme foursee
catch
endtry

set background=dark

" colorscheme
" # colorscheme desert


" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" No matter what I am editing, I like to see line numbers to the left; however, gestures are a lot
" easier if the line numbers are *relative*, so that's what I set.
set relativenumber


" As a matter of best practice, I try to keep all lines in files from exceeding 80 characters so
" there are no wrapping issues when viewed anywhere. The following command will create a vertical
" line at 80 characters. In most of my color themes, it will show as gray.
set colorcolumn=80
set textwidth=100

" The following comment should have tabs and trailing spaces highlighted
" Tabs	 and extra whitespace   are evil, so let's highlight them 
"	with some fun characters.      	
set listchars=tab:»·,trail:·,nbsp:~
" set listchars=tab:>=,trail:.,nbsp:~
" set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~
set list
" For go (golang) setlocal nolist is set in after/ftplugin/vim.go

" I like to see the line on which the cursor sits to be highlighted so it is easier to locate.
set cursorline


" Display the cursor position on the last line of the screen or in the status
" line of a window
" set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" The `smartindent` option has Vim use intelligent rules to determine when and how much to indent.
" This is very handy when editing code or bulleted lists.
set smartindent


"" wrap lines but do not insert linebreaks
"" see http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
set wrap
set linebreak
" set nolist  " list disables linebreak but want to see tabs etc (see above)
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

" Now we want Vim to behave like other editors with regard to open files; by setting this option,
" Vim allows us to have edited buffers "hidden" behind the current one.
set hidden

"" Spell Checking
map <F5> :setlocal spell! spelllang=en_us<CR>
" F5 to activate spelling

hi SpellBad cterm=underline ctermbg=LightGrey
hi SpellRare cterm=underline ctermbg=LightGrey



"" MARKDOWN
"" present MD as markdown files: see http://robinlovelace.net/computing/2013/10/31/vim-for-markdown.html
au BufRead,BufNewFile *.md.* set filetype=markdown

"" CRTL-P https://github.com/kien/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"" .. default is not to show hidden files for performance.
let g:ctrlp_show_hidden = 1  




