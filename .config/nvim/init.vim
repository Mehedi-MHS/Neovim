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
set wildmode=list:longest

"show file title
set title

set encoding=utf-8

"Background color NavyBlue
"highlight Normal ctermbg=17

"Same as Dracula theme background color
set background=dark
highlight Normal guibg=#202945
"highlight Normal guibg=#282a36



" Change the background color of the floating window that shows suggestions
highlight CocFloating guibg=#094f46

" Change the text color of the floating window that shows suggestions
highlight CocFloating guifg=#ffffff


" Change the background color of the window that shows errors or info
highlight CocErrorSign guibg=#ff0000


" Change the text color of the window that shows errors or info
highlight CocErrorSign guifg=#ffffff




"PLUGINS ---------------------------------------------------------------- {{{


call plug#begin('~/.vim/plugged')

" Plugin code goes here.
" added 'lazy':1 for lazy loading pligins when they need  to use, idea from chatGPT

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs',{'lazy':1}
Plug 'nvim-tree/nvim-web-devicons',{'lazy':1}
Plug 'nvim-tree/nvim-tree.lua'
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
nnoremap pp :w <CR>:! python %<CR>
nnoremap ss :w <CR>:! mysql -u root -proot DB001 < %<CR>

"press F5 while editing file to save it
inoremap <F5> <esc>:w <CR>
nnoremap <F5> :w <CR>


"Enables mouse scrolling in editing mode
inoremap <ScrollWheelUp> <C-Up>
inoremap <ScrollWheelDown> <C-Down>



"From github-coc page: use CTRL+f to scroll documentaton floating down and
"CTRL+b to scroll up
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750


  "modified now
" nnoremap <nowait><expr> <C-Up> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
 "nnoremap <nowait><expr> <C-Down> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
 "inoremap <nowait><expr> <C-Up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
 "inoremap <nowait><expr> <C-Down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

"for enabling enter key to select suggestions
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"


 "My modified setting: use mouse wheel to scroll Documentation floating(cocFloating)
 "and arrow keys to scroll suggestion menu
 "nnoremap <nowait><expr> <ScrollWheelDown> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
 "nnoremap <nowait><expr> <ScrollWheelUp> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
 "inoremap <nowait><expr> <ScrollWheelDown> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
 "inoremap <nowait><expr> <ScrollWheelUp> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
 "







"Shortcut for NvimTree

nnoremap <C-f> :NvimTreeToggle<CR>
inoremap <C-f><esc> :NvimTreeToggle<CR>


"The following mappings in your vimrc provide a quick way to move lines of text up or down. The mappings work in normal, insert and visual modes, allowing you to move the current line, or a selected block of lines.
"from vim.fandom.com. [alt+j] to move lines/selected block down and [alt+k] to move up
 "nnoremap <A-j> :m .+1<CR>==
 "nnoremap <A-k> :m .-2<CR>==
 "inoremap <A-j> <Esc>:m .+1<CR>==gi
 "inoremap <A-k> <Esc>:m .-2<CR>==gi
 "vnoremap <A-j> :m '>+1<CR>gv=gv
 "vnoremap <A-k> :m '<-2<CR>gv=gv

"COPY Lines up and Down
"=======================
"use yyp to copy down and paste 1 time
"use yy3p to copy down and paste  times
"use yyP to copy up and paste 1 time
"use yy3P to copy up and paste 3 times





"}}}
"


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

"highlight CocFloating ctermbg=77
"Shortcut for prettier extension. Now if you type :Prettier the code will
"force format
"
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument



"From github for scrolling coc floating window
"autocmd CursorHold * if ! coc#util#has_float() | call CocActionAsync('doHover') | endif

" Enable coc-tailwindcss
"let g:coc_global_extensions = ['coc-tailwindcss']

" Set up autocompletion for Tailwind classes in HTML and CSS files
autocmd FileType html,css setlocal omnifunc=coc#refresh()




" }}}

"Lua script  ----------------------------------------------------------{{{
"Lua script to run inside vimscript(for nvim tree plugin)


 "lua << EOF
 "
 "--disable netrw at the very start of your init.lua (strongly advised)
 "vim.g.loaded_netrw = 1
 "vim.g.loaded_netrwPlugin = 1
 "
 "-- set termguicolors to enable highlight groups
 "vim.opt.termguicolors = true
 "--my personal settings
 "vim.api.nvim_command([[
 "    augroup ChangeBackgroudColour
 "        autocmd colorscheme * :hi normal guibg=#0a0a0a
 "    augroup END
 "]])
 "
 "
 "-- empty setup using defaults
 "require("nvim-tree").setup()
 "
 "EOF
 "

"}}}

" Adding external lua file in init.vim file

lua require("nvimTreeSettings")
