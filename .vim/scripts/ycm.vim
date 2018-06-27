let g:ycm_server_use_vim_stdout = 0
let g:ycm_server_keep_logfiles = 1
let g:ycm_path_to_python_interpreter = "~/.pyenv/versions/3.5.4/bin/python"
let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_rust_src_path = "~/.cargo/bin"

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>

let g:ycm_rust_src_path = "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
