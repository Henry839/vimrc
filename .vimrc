" Display a friendly cat whenever opening Vim
echo ">^.^<" 
let mapleader = ","

set nocompatible

imap jj <ESC>

syntax on
filetype on
filetype plugin on
filetype indent on	
set shortmess+=I

set number

set norelativenumber
"set tw=0
set laststatus=2
"set colorcolumn=0
set backspace=indent,eol,start

set hidden

set ignorecase
set smartcase

set incsearch

set tabstop=4
set expandtab
set shiftwidth=4
"set autoindent
"set smartindent


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

" opening .vimrc fast
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source .vimrc fast
nnoremap <leader>sv :source $MYVIMRC<cr>
" open terminal and move it to the bottom
" nnoremap <leader>tt :terminal<cr><C-w>r<C-w>N10<C-w>-a
" use control-c to copy
vnoremap <C-C> "+y
" move the cursor to previous line
nnoremap <leader>b <C-o>
" move the cursor to next line
nnoremap <leader>w <C-i>


" autocmd
augroup spam
    au!
    au! BufRead,BufNewFile *.py setfiletype python
    au! BufRead,BufNewFile *.cpp setfiletype cpp
    au! BufRead,BufNewFile *.c setfiletype cpp
    au! BufRead,BufNewFile *.h setfiletype cpp
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " nerdtree setup
" Start NERDTree and put the cursor back in the other window.
    autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    " nerdtree automatically update
    autocmd BufEnter NERD_tree_* | execute 'normal R'

augroup END

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'skywind3000/asyncrun.vim'
call plug#end()
" Airline theme
let g:airline_theme='luna'


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
set updatetime=300
set signcolumn=yes
set pumheight=10
let b:coc_diagnostic_disable=1


" for cpp
" asyncrun setup
" 自动打卡quickfix_window， 高度为6
let g:asyncrun_open = 6
" 任务结束的时候响铃提醒
let g:asyncrun_bell = 1

" 设置<leader>co为打开/关闭Quickfix窗口
nnoremap <leader>co :call asyncrun#quickfix_toggle(6)<cr>




