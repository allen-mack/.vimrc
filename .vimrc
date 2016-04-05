"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()
call pathogen#helptags()

" AIRLINE
set laststatus=2   " Make sure that the status bar is always visible
set t_Co=256       " Set the color scheme

" COLOR
set background=dark
color grb256

" Automatic reloading of _vimrc
autocmd! bufwritepost _vimrc source %

" Markdown - Treat *.md files as markdown instead of Modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Print Options
set printoptions=paper:letter,duplex:long

" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Resize vertical splits
noremap } <C-w>>
noremap { <C-w><

" make backspace behave like normal again
set bs=2

" edit and source the vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MyVIMRC<cr>

" easier moving between tabs
map <Leader>[ <esc>:tabprevious<CR>
map <Leader>] <esc>:tabnext<CR>

" bind Ctrl+<movement> keys to move around the windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" map vsplit carousel keys
map <F12> <c-w>l<c-w><bar>
map <F11> <c-w>h<c-w><bar>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" Toggle RELATIVE NUMBERS
nnoremap <Leader>r :set rnu!<cr>

" STAMP from yank register
nnoremap <Leader>p "0p

" easier way to escape from insert mode
inoremap jk <esc>

" pretty print the file.
com! Fjson %!python -m json.tool
com! Fxml %!xmllint --format --recover - 2>/dev/null
" open splits in a more intuitive way
set splitbelow              " Splits window BELOW current window
set splitright              " Open new split on the right

" map vim-spec commands
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on

" real programmers don't use TABs but spaces
set shiftwidth=4 " operation >> indents 4 cols; << unindents 4 cols
set tabstop=4 " a hard TAB displays as 4 cols
set expandtab " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPC
set shiftround " round indent to multiple of 'shiftwidth'
set autoindent " align the new line indent with the previous line

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" autocmd BufNewFile,BufRead *.json set ft=javascript

function Vfit()
    let l:maxColumns = max(map(range(1, line('$')), "col([v:val, '$'])")) - 1
    silent! execute 'vertical resize ' . l:maxColumns
endfunction
