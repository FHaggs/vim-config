set relativenumber
nnoremap <Space> <Nop>
let mapleader=" "

nnoremap <Leader>y "+yy
vnoremap <Leader>y "+yy
nnoremap <Leader>p "*p
vnoremap <Leader>p "*p

" Map <Leader>T to open netrw
nnoremap <Leader>t :Explore<CR>

set path+=**
set wildmenu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Temporary/swap files
set wildignore+=*~                             " Backup files
set wildignore+=*.pyc,*.pyo,*.pyd             " Python compiled files
set wildignore+=__pycache__                   " Python cache directory
set wildignore+=node_modules                  " Node.js modules directory
set wildignore+=*/.git/*                      " Git version control directory
set wildignore+=*/.hg/*                       " Mercurial version control directory
set wildignore+=*/.svn/*                      " Subversion version control directory
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rsp,*.suo,*.pdb,*.idb,*.ilk " C/C++/Rust object files and executables
set wildignore+=*.d,*.tlog                    " Rust and C intermediate files
set wildignore+=*.dll,*.so,*.dylib            " Shared libraries
set wildignore+=*.hi,*.chi,*.chs.h,*.dyn_o,*.dyn_hi " Haskell/Rust intermediate files
set wildignore+=*.rbc,*.class                 " Ruby/Java compiled files
set wildignore+=.DS_Store                     " MacOS filesystem files
set wildignore+=Thumbs.db                     " Windows image file cache
set wildignore+=*.npmignore,*.eslintcache,*.stylelintcache " Various caches
set wildignore+=*.log                         " Log files
set wildignore+=*.tar.gz,*.zip,*.rar,*.gz,*.bz2,*.tgz " Compressed files
set wildignore+=*.png,*.jpg,*.jpeg,*.gif,*.bmp,*.tiff,*.ico,*.svg,*.webp " Image files
set wildignore+=*.mp4,*.avi,*.mkv,*.mpg,*.mpeg,*.mov,*.wmv " Video files
set wildignore+=*.mp3,*.ogg,*.flac,*.wav,*.aac " Audio files
set wildignore+=*.pdf,*.doc,*.docx,*.ppt,*.pptx,*.xls,*.xlsx " Document files

set laststatus=2           " Always display the status line
set statusline=%f          " Set the status line to show the file name

nnoremap <Leader>j :bnext<CR>
nnoremap <Leader>k :bprevious<CR>

nnoremap <Leader>s :w<CR>:bd<CR>

