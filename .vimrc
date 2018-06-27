if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

if !empty(glob('~/.vim/autoload/plug.vim'))
    call plug#begin('~/.vim/plugged')
    " Misc
    Plug 'editorconfig/editorconfig-vim'
    Plug 'tpope/vim-speeddating'
    " Theme
    Plug 'itchyny/lightline.vim'
    Plug 'fxn/vim-monochrome'
    " Navigation
    Plug 'tpope/vim-rsi'
    Plug 'google/vim-searchindex' " Show match count for search
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    " Shortcuts
    Plug 'rizzatti/dash.vim'
    Plug 'direnv/direnv.vim'
    Plug 'roxma/nvim-completion-manager'
    Plug 'jeetsukumaran/vim-indentwise'
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    " Langs
    Plug 'sheerun/vim-polyglot'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
    Plug 'rust-lang/rust.vim'
    Plug 'racer-rust/vim-racer'
    Plug 'vim-syntastic/syntastic' 
    Plug 'Shirk/vim-gas'
    Plug 'PProvost/vim-ps1'
    Plug 'autozimu/LanguageClient-neovim', {
          \ 'branch': 'next',
          \ 'do': './install.sh',
          \ }
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugin' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'ervandew/supertab'
    Plug 'Shougo/context_filetype.vim'
    Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
    Plug 'davidhalter/jedi-vim'
    Plug 'sebastianmarkow/deoplete-rust'
    " Erlang
    Plug 'vim-erlang/vim-erlang-tags'
    Plug 'vim-erlang/vim-erlang-runtime'
    Plug 'vim-erlang/vim-erlang-omnicomplete'
    Plug 'vim-erlang/vim-erlang-compiler'
    " Elixir
    Plug 'elixir-editors/vim-elixir'
    Plug 'avdgaag/vim-phoenix'
    Plug 'mmorearty/elixir-ctags'
    Plug 'mattreduce/vim-mix'
    Plug 'BjRo/vim-extest'
    Plug 'frost/vim-eh-docs'
    Plug 'slashmili/alchemist.vim'
    Plug 'tpope/vim-endwise'
    Plug 'jadercorrea/elixir_generator.vim'
    " Markup
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    " Automation
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-obsession'
    " Utility
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'zenbro/mirror.vim'
    Plug 'kien/ctrlp.vim'
    Plug 'neomake/neomake'
    Plug 'ConradIrwin/vim-bracketed-paste'
    Plug 'pearofducks/ansible-vim'
    Plug 'terryma/vim-smooth-scroll'
    Plug 'wincent/command-t'
    Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
    Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'
    " Application
    Plug 'mattn/webapi-vim'
    Plug 'mmai/vim-markdown-wiki'
    Plug 'majutsushi/tagbar'
    " Add plugins to &runtimepath
  call plug#end()
endif

let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
nmap <leader>b :TagbarToggle<CR>
map <Tab> <C-W>w
map <Bar> <C-W>v<C-W><Right>
map _     <C-W>s<C-W><Down>

" tab navigation mappings
map tt :tabnew 
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on
set encoding=utf8
set tabstop=2
set shiftwidth=2
set expandtab
set exrc

hi Comment cterm=italic
hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235
set shell=/usr/local/bin/zsh
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
syntax enable
set t_Co=256
set termguicolors
set background=dark
set guifont=SpaceMonoForPowerline:h10 

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
let g:monochrome_italic_comments = 1
colorscheme monochrome

let g:lightline = {
  \   'colorscheme': 'nord',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
set statusline=%=&P\ %f\ %m

" Syntastic Stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" for tmux to automatically set paste and nopaste mode at the time pasting (as
" happens in VIM UI)

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

"set t_8b=^[[48;2;%lu;%lu;%lum
"set t_8f=^[[38;2;%lu;%lu;%lum

map <F2> :.w !pbcopy<CR><CR>
map <F3> :r !pbpaste<CR>
let g:python_host_prog = '/Users/locnguyen/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/locnguyen/.pyenv/versions/neovim3/bin/python'
let g:ycm_server_python_interpreter = '/Users/locnguyen/.pyenv/versions/neovim3/bin/python'
let g:OmniSharp_server_use_mono = 1

set statusline +=%#warningmsg#
set statusline +=%{SyntasticStatuslineFlag()}
set statusline +=%*
"
" Syntastic stuff
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set noshowmode
set laststatus=2
set shell=/usr/local/bin/zsh
set clipboard=unnamed

autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

for s:fpath in split(globpath("~/.vim/scripts", '*.vim'), '\n')
  exe 'source' s:fpath
endfor

set secure
