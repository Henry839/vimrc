" 设置<leader>cp为编译单个文件
"nnoremap <silent> <leader>cp :w<CR>:AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"<cr>
nnoremap <silent> <leader>cp :w<CR>:AsyncTask file-build<cr>

" 设置<leader>rn为运行文件
" nnoremap <silent> <leader>rn :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
nnoremap <silent> <leader>rn :AsyncTask file-run<cr>

let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 

" 设置来编译整个项目
nnoremap <silent> <leader>cpa :wa<cr>:AsyncTask project-build<cr>
" 设置来运行整个项目 
nnoremap <silent> <leader>rna :wa<cr>:AsyncTask project-run<cr>






