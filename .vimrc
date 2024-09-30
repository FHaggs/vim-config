set relativenumber
set number
let mapleader=" "
set tabstop=4       " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent
set expandtab       " Use spaces instead of tabs
set ic              " search not case sensitive
nnoremap <Leader>y "+yy
vnoremap <Leader>y "+yy
nnoremap <Leader>p "*p
vnoremap <Leader>p "*p

" Enable search highlighting
set hlsearch

" Automatically clear search highlight when you press Esc
nnoremap <Leader><Esc> :nohlsearch<CR>

call plug#begin("~/.vim/plugged")
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
call plug#end()
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'
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

nnoremap <C-D> <C-D>zz
nnoremap <C-U> <C-U>zz

" Set up CoC for Python with Pyright
autocmd FileType python setl omnifunc=coc#complete
let g:coc_global_extensions = ['coc-pyright']

" COC STUFF
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>e  <Plug>(coc-format-selected)
nmap <leader>e  <Plug>(coc-format-selected)
nmap <leader>qf  <Plug>(coc-fix-current)
command! -nargs=0 Format :call CocActionAsync('format')

augroup python_formatting
  autocmd!
  autocmd FileType python setlocal formatprg=ruff\ format\ -
augroup END

