set relativenumber
let mapleader=" "
set tabstop=4
set expandtab 

nnoremap <Leader>y "+yy
vnoremap <Leader>y "+yy
nnoremap <Leader>p "*p
vnoremap <Leader>p "*p

call plug#begin("~/.vim/plugged")
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Map <Leader>T to open netrw
nnoremap <Leader>t :Explore<CR>


set laststatus=2           " Always display the status line
set statusline=%f          " Set the status line to show the file name

nnoremap <Leader>j :bnext<CR>
nnoremap <Leader>k :bprevious<CR>
nnoremap <Leader>s :w<CR>:bd<CR>
nnoremap <Leader>q :bd!<CR>
nnoremap <Leader>b :Buffers<CR>


nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>v :Rg<Space>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
" COC STUFF
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
