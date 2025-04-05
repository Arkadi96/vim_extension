" Gruvbox light enable
syntax on
set background=dark
colorscheme gruvbox

" Set tab behavior
set expandtab      " Convert tabs to spaces
set shiftwidth=4   " Indent width for auto-indent
set softtabstop=4  " Insert 3 spaces when pressing Tab
set tabstop=4      " Display existing tab as 3 spaces

" Convert existing tabs to spaces
autocmd BufWritePre * :retab

" Highlight text that goes beyond 80 columns
highlight OverLength ctermbg=lightgrey guibg=#333333

" Regex match for columns after 80
match OverLength /\%81v.\+/

" Enable spell check for comments and strings only
augroup c_spellcheck
  autocmd!
  autocmd FileType c,cpp setlocal spell spelllang=en spellcapcheck=
  autocmd FileType c,cpp syntax spell toplevel
augroup END

