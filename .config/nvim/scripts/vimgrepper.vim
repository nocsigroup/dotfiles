" vim-grepper
let g:grepper = {}
let g:grepper.tools = ['rg', 'grep', 'git']
let g:grepper.rg = { 'grepprg': 'rg -SH --no-heading --vimgrep' }

nmap <leader>g :Grepper<CR>
nmap <Leader>G :Grepper -cword -noprompt<CR>

