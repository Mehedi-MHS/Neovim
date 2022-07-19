
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

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

"enable mouse support
set mouse=a

"shows a more advanced menu for auto-completion suggestions.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
"set wildmode=list:longest

"show file title
set title


"Background color NavyBlue
highlight Normal ctermbg=17 
" PLUGINS ---------------------------------------------------------------- {{{


call plug#begin('~/.vim/plugged')

" Plugin code goes here.

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'

call plug#end()




" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.



"01:byme:type nn to run current file in nodejs
"nnoremap {what i type} {what is executed}
"<CR> (carriage return)is like pressing the enter key
":w saves(writes) the file
" here % replaces with current filename


nnoremap nn :w <CR>:! node %<CR>

"press F5 while editing file to save it
inoremap <F5> <esc>:w <CR>


"Enables mouse scrolling in editing mode
inoremap <ScrollWheelUp> <C-Up>
inoremap <ScrollWheelDown> <C-Down>



"From github-coc page: use CTRL+f to scroll documentaton floating down and 
"CTRL+b to scroll up
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
 "nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
 "nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
 "inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
 "inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
 

 "My modified setting: use mouse wheel to scroll Documentation floating(cocFloating)
 "and arrow keys to scroll suggestion menu
nnoremap <nowait><expr> <ScrollWheelDown> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <ScrollWheelUp> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <ScrollWheelDown> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <ScrollWheelUp> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"



"}}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.






"By me-From stackOverflow: Change autocomplete 
"background 

highlight CocFloating ctermbg=77
"Shortcut for prettier extension. Now if you type :Prettier the code will
"force format
"
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument



"From github for scrolling coc floating window
"autocmd CursorHold * if ! coc#util#has_float() | call CocActionAsync('doHover') | endif 



" }}}



" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}


" My Personal Settings ----------------{{{

" 01:type htm5<space> to get html5 template
:abbreviate htm5 <!DOCTYPE html> <html> <head> <title>...</title> <meta name='viewport' content='width=device-width,initial-scale=1'/> </head> <body> </body></html>

" }}}
