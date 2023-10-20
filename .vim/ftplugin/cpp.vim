" 设置<leader>cp为编译单个文件
nnoremap <silent> <leader>cp :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"<cr>

" 设置<leader>rn为运行文件
nnoremap <silent> <leader>rn :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 

" 设置来编译整个项目
nnoremap <silent> <leader>cpa :AsyncRun -cwd=<root> make <cr>
" 设置来运行整个项目 
nnoremap <silent> <leader>rna :AsyncRun -cwd=<root> -raw make run <cr>






