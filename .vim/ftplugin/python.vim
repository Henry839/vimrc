" asyncrun for python
let PYTHONUNBUFFERED=1
nnoremap <leader>rn :w<CR> :AsyncRun -raw -cwd=$(VIM_FILEDIR) python "$(VIM_FILEPATH)"<CR>
