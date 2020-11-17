" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set enc=utf-8

set guifont=FiraCodeNerdFont:h11

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')
    
    Plug 'preservim/nerdtree'
    
    Plug 'dense-analysis/ale'

    Plug 'joshdick/onedark.vim'
   
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Themes
    Plug 'tomasiser/vim-code-dark'
    Plug 'joshdick/onedark.vim'
    
    " Syntax support
    Plug 'towolf/vim-helm'

call plug#end()

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" Type jj to exit insert mode quickly.
inoremap jj <esc>
" Press the space bar to type the : character in command mode.
nnoremap <space> :
" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" NERDTree Mappings
"
nnoremap <F3> :NERDTreeToggle<cr>
" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}

" NERDTree specific configuration

" Enable NERDTree on vim start-up
autocmd VimEnter * NERDTree

" Auto close NERDTree when closing vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Auto-reload the NERDTree window when there is a change in the file structure
autocmd BufEnter NERD_tree_* | execute 'normal R'
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

"Reload the window if directory is changed
augroup DIRCHANGE
    au!
    autocmd DirChanged global :NERDTreeCWD
augroup END

" Theme configuration

" Enable 256 colors
set t_Co=256
set t_ut=

" Activates italicized comments (make sure your terminal supports italics)
let g:codedark_italics=1

" Make the background transparent
let g:codedark_transparent=1

colorscheme codedark
