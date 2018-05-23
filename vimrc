set nocompatible              " Must come first because it changes other options.
set nocp
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'fatih/vim-go'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/vim-gitbranch'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()
filetype plugin indent on

syntax on
colorscheme jellybeans

set laststatus=2
set noshowmode
set statusline=
set statusline+=%1*
set statusline+=\[%{gitbranch#name()}\]
set statusline+=\ %F
set statusline+=\ [%l:%c/%L\]
set statusline+=\ [%{mode()}\]
set statusline+=%#LineNr#

hi User1 ctermbg=244 ctermfg=219 guibg=green guifg=red

set showcmd                       " Display incomplete commands.
" set incsearch                     " Show match when typing
set hlsearch                      " Highlight all search matches
set lazyredraw                    " Dont redraw between macros
set timeoutlen=500                " Time to wait for second key press

set backspace=indent,eol,start    " Intuitive backspacing.
set foldmethod=manual

set number                        " Enable numbers
set hidden                        " Unsaved changes to buffer. :ls to see buffers. :b[n] to switch buffer
set autoindent

set wrap                          " Turn on line wrapping.

set nobackup
set noswapfile

set pastetoggle=<F2>

" draw vertical line for long lines
highlight ColorColumn ctermbg=234
execute "set colorcolumn=" . join(range(100,335), ',')

set mouse=a                      " Enable mouse input
set clipboard+=unnamed           " Use system clipboard
noremap ; :
noremap j gj
noremap k gk
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs
set nocursorcolumn
set cursorline
set ai
set ts=2
set softtabstop=2
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

set showmatch "show matching brackets

" Ignore vendor folder (for Go dependencies)
set wildignore+=*/vendor/*
let g:ctrlp_custom_ignore = {
  \ 'dir': '/vendor/',
  \ }

" Map leader to ,
map , \

" Clear search buffer with return
noremap <CR> :nohlsearch<cr>

" CTRL + n = remove blank space at the end of lines
nnoremap <silent> <C-n> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" disable vim-go to create template file
let g:go_template_autocreate = 0
