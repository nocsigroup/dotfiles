"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && !g:actualvim | NERDTree | endif
"map <C-O> :NERDTreeToggle<CR>
"let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
" NERDTree
let NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'

" NERDCommenter
let NERDSpaceDelims = 1
