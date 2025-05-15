" Gruvbox light enable
syntax on
set background=dark
colorscheme gruvbox

" Set tab behavior
" set expandtab
set shiftwidth=4   " Indent width for auto-indent
set softtabstop=4  " Insert 4 spaces when pressing Tab
set tabstop=4      " Display existing tab as 4 spaces

" Automatically indent new lines when pressing Enter
set autoindent
set smartindent
set formatoptions+=r " Auto-insert comment leader on Enter
set formatoptions+=o " Auto-insert comment leader when using 'o' or 'O'

" Convert existing tabs to spaces
autocmd BufWritePre * :retab

" Highlight text that goes beyond 80 columns
highlight OverLength ctermbg=lightgrey guibg=#333333

" Set the highlight color for trailing spaces
highlight RedundantSpaces ctermbg=red guibg=red

" Function to apply both matches
function! SetHighlights()
    " Clear old matches (optional, prevents duplicates)
    call clearmatches()

    " (A) Match trailing whitespace
    call matchadd('RedundantSpaces', '\s\+$')

    " (B) Match lines longer than 80 chars (adjust regex as needed)
    call matchadd('OverLength', '\%>80v.\+')
endfunction

" Apply when opening a buffer and on colorscheme changes
autocmd BufWinEnter,ColorScheme * call SetHighlights()

" Enable spell check for comments and strings only
augroup c_spellcheck
  autocmd!
  autocmd FileType c,cpp,hpp setlocal spell spelllang=en spellcapcheck=
  autocmd FileType c,cpp,hpp syntax spell toplevel
augroup END

