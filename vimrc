" Gruvbox light enable
syntax on
set background=dark
colorscheme gruvbox

" Set tab behavior
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Automatically indent new lines when pressing Enter
set autoindent
set smartindent
set formatoptions+=r " Auto-insert comment leader on Enter
set formatoptions+=o " Auto-insert comment leader when using 'o' or 'O'
set hlsearch
set incsearch

" Convert existing tabs to spaces
autocmd BufWritePre * :retab

" Highlight text that goes beyond 80 columns
highlight OverLength ctermbg=236 guibg=#3c3836

" Set the highlight color for trailing spaces
highlight RedundantSpaces ctermbg=red guibg=red

highlight Search    ctermfg=NONE ctermbg=239 guifg=NONE guibg=#504945

highlight IncSearch ctermfg=black ctermbg=214 guifg=#282828 guibg=#fabd2f

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

" Search for tags file in current and parent directories
set tags=./tags;,tags;

" Generate tags recursively for C/C++ sources
nnoremap <C-F9> :!ctags -R --languages=C,C++ --fields=+iaS --extras=+q .<CR><CR>

" Use grep recursively
set grepprg=grep\ -RnH\ --exclude=tags

" Ctrl+F5 - Search in C/C++ source files under current directory
nnoremap <C-F5> :execute 'grep! -E "\<' . expand('<cword>') . '\>" --include=*.{c,cpp,h,hpp} --exclude-dir=.svn --exclude-dir=.git .'<CR>:copen<CR>

" Ctrl+F6 - Search in all files under current directory
nnoremap <C-F6> :execute 'grep! -E "\<' . expand('<cword>') . '\>" .'<CR>:copen<CR>

" Codeium install
call plug#begin()
" the codium plugin
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
call plug#end()
" Autoplugin
let g:codeium_disable_bindings = 0
