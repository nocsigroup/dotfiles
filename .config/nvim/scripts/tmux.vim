":noremap <silent> <Space> :silent noh<Bar>echo<CR>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1
"let g:tmux_navigator_save_on_switch = 2
nnoremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

let s:key_to_direction_map = {
      \ 'h': 'left',
      \ 'j': 'down',
      \ 'k': 'up',
      \ 'l': 'right'
      \ }

function! s:ChunkSwitch(key)
  let cmd="~/.bin/chunkwm-tmux-navigator.sh tmux " . get(s:key_to_direction_map, a:key, '')
  silent call system(cmd)
endfunction

command! ChunkNavigateLeft call s:ChunkSwitch('h')
command! ChunkNavigateDown call s:ChunkSwitch('j')
command! ChunkNavigateUp call s:ChunkSwitch('k')
command! ChunkNavigateRight call s:ChunkSwitch('l')

nnoremap <silent> <c-h> :ChunkNavigateLeft<cr>
nnoremap <silent> <c-j> :ChunkNavigateDown<cr>
nnoremap <silent> <c-k> :ChunkNavigateUp<cr>
nnoremap <silent> <c-l> :ChunkNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
