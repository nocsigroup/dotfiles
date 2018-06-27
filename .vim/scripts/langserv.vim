" LanguageClient plugin

" Automatically start language servers.
" let g:LanguageClient_autoStart = 1
let g:LanguageClient_autoStart = 0

" Minimal LSP configuration for JavaScript
"let g:LanguageClient_serverCommands = {}
"if executable('javascript-typescript-stdio')
"  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  " Use LanguageServer for omnifunc completion
"  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
"else
"  echo \"javascript-typescript-stdio not installed!\n"
"  :cq
"endif

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'go': ['go-langserver'] }
autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
    \ 'python': ['pyls'],

"#noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
"#noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
"#noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
"noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>
