" Run linter on write
autocmd! BufWritePost * Neomake
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1
call neomake#configure#automake('nw', 1000)
let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'
let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'dogma']
