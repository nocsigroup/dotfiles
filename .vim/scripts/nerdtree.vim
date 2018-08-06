"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && !g:actualvim | NERDTree | endif
"map <C-O> :NERDTreeToggle<CR>
"let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
