"ALE conf"
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

noremap <Leader>ad :ALEGoToDefinition<CR>
nnoremap <leader>af :ALEFix<cr>
noremap <Leader>ar :ALEFindReferences<CR>

"Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

augroup elixir
  nnoremap <leader>r :! elixir %<cr>
  autocmd FileType elixir nnoremap <c-]> :ALEGoToDefinition<cr>
augroup END

let g:ale_linters = {}
let g:ale_linters.scss = ['stylelint']
let g:ale_linters.css = ['stylelint']
let g:ale_linters.elixir = ['elixir-ls', 'credo']
let g:ale_linters.ruby = ['rubocop', 'ruby', 'solargraph']

let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fixers.javascript = ['eslint']
let g:ale_fixers.scss = ['stylelint']
let g:ale_fixers.css = ['stylelint']
let g:ale_fixers.elm = ['format']
let g:ale_fixers.ruby = ['rubocop']
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_fixers.elixir = ['mix_format']

let g:ale_elixir_elixir_ls_release = '/Users/locnguyen/.bin/elixir-ls/rel'
let g:ale_sign_column_always = 1

" ALE
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <plug>(ale_previous)
nmap <silent> ]w <plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

nnoremap df :ALEFix<cr>

" vim-jsx conf
let g:jsx_ext_required = 0
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

"Goyo conf"
nnoremap <leader>gg :Goyo<CR>
