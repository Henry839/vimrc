" Display a friendly cat whenever opening Vim
echo ">^.^<" 
"Leader key setup
let mapleader = ","


set nocompatible

syntax on

filetype on
filetype plugin on
filetype indent on	
set shortmess+=I

set number

set norelativenumber
set tw=0
set laststatus=2
set colorcolumn=0
set backspace=indent,eol,start

set hidden

set ignorecase
set smartcase

set incsearch


set noerrorbells visualbell t_vb=

set mouse+=a

nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
" moving the line up and down
nnoremap _ :m -2 <enter>
nnoremap - :m +1 <enter>

" make the line blank
nnoremap <leader>d ddO
" opening .vimrc fast
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source .vimrc fast
nnoremap <leader>sv :source $MYVIMRC<cr>
" open terminal
nnoremap <leader>tt :terminal<cr>
" use control-c to copy
vnoremap <C-C> "+y
" move the cursor to previous line
nnoremap <leader>b <C-o>
" move the cursor to next line
nnoremap <leader>w <C-i>

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
call plug#end()
" Airline theme
let g:airline_theme='luna'


" nerdtree setup
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" coc.nvim setup
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
set updatetime=300
set signcolumn=yes
set pumheight=10
