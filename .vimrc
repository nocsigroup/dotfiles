if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

if !empty(glob('~/.vim/autoload/plug.vim'))
    call plug#begin('~/.vim/plugged')
    " Aesthetics
    Plug 'junegunn/rainbow_parentheses.vim', {'type': 'opt'}
    Plug 'ryanoasis/vim-devicons'
    Plug 'itchyny/lightline.vim'
    " Functionality

    " Misc
    Plug 'editorconfig/editorconfig-vim'
    " Theme
    Plug 'fxn/vim-monochrome'
    Plug 'NLKNguyen/papercolor-theme'
    " Navigation
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-session'
    Plug 'google/vim-searchindex' " Show match count for search
    " Git
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-obsession'
    Plug 'tpope/vim-rsi'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-speeddating'
    Plug 'airblade/vim-gitgutter'
    " Shortcuts
    Plug 'rizzatti/dash.vim'
    Plug 'direnv/direnv.vim'
    Plug 'jeetsukumaran/vim-indentwise'
    Plug 'honza/vim-snippets'
    " Langs
    Plug 'sheerun/vim-polyglot'
    Plug 'neovim/nvim-lspconfig', {'type': 'opt'}
    Plug 'hashivim/vim-terraform'
    Plug 'juliosueiras/vim-terraform-completion'
    Plug 'Shirk/vim-gas'
    Plug 'PProvost/vim-ps1'
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugin' }
      Plug 'Shougo/deoplete-lsp'
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'ervandew/supertab'
    Plug 'Shougo/context_filetype.vim'
    Plug 'davidhalter/jedi-vim'
    Plug 'avakhov/vim-yaml'
    Plug 'sebastianmarkow/deoplete-rust'
    " Rust
    Plug 'rust-lang/rust.vim'
    Plug 'racer-rust/vim-racer'
    " Erlang
    Plug 'vim-erlang/vim-erlang-tags'
    Plug 'vim-erlang/vim-erlang-runtime'
    Plug 'vim-erlang/vim-erlang-omnicomplete'
    Plug 'vim-erlang/vim-erlang-compiler'
    " Elixir
    " Plug 'elixir-lsp/elixir-ls', { 'do': { -> g:ElixirLS.compile() } }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
    Plug 'elixir-editors/vim-elixir'
    Plug 'avdgaag/vim-phoenix'
    Plug 'mmorearty/elixir-ctags'
    Plug 'mattreduce/vim-mix'
    Plug 'BjRo/vim-extest'
    Plug 'frost/vim-eh-docs'
    Plug 'slashmili/alchemist.vim'
    Plug 'jadercorrea/elixir_generator.vim'
    Plug 'carlosgaldino/elixir-snippets'
    " Golang
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " Automation
    " Utility
    Plug 'w0rp/ale'
    Plug 'mattn/emmet-vim'
    Plug 'vim-test/vim-test'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'zenbro/mirror.vim'
    Plug 'kien/ctrlp.vim'
    Plug 'neomake/neomake'
    "Plug 'vim-syntastic/syntastic'
    Plug 'ConradIrwin/vim-bracketed-paste'
    Plug 'pearofducks/ansible-vim'
    Plug 'terryma/vim-smooth-scroll'
    Plug 'wincent/command-t'
    Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
    Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'
    " Application
    Plug 'mattn/webapi-vim'
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
set exrc

" let g:coc_global_extensions = ['coc-elixir', 'coc-diagnostic']

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

hi Comment cterm=italic
hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235
set shell=/opt/homebrew/bin/zsh
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

" let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

"colorscheme lucius
set background=dark
colorscheme PaperColor

let g:lightline = { 'colorscheme': 'PaperColor' }
" let g:lightline = {
"   \ 'colorscheme': 'onedark',
"  \ }

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }

" Other Configurations
set fillchars+=vert:\
set foldenable foldmethod=syntax foldlevelstart=99 foldcolumn=1
set ignorecase smartcase
set inccommand=split
set list listchars=trail:»,tab:»-
set number relativenumber
set scrolloff=2
set showmatch
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set title
set wrap breakindent
set colorcolumn=80,100
set lazyredraw
set undofile
set splitbelow splitright

let &undodir = $HOME . "/.config/nvim/undo"
" let g:python3_host_prog = '/opt/homebrew/bin/python3'
let g:python3_host_prog = '/Users/locnguyen/.zinit/plugins/pyenv---pyenv/shims/python3'
let g:polyglot_is_disabled={}
" }}}
set guioptions-=e  " Don't use GUI tabline
set statusline=%=&P\ %f\ %m

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

map <F2> :.w !pbcopy<CR><CR>
map <F3> :r !pbpaste<CR>

set fillchars=vert:\ ,stl:\ ,stlnc:\
set noshowmode
set laststatus=2
set clipboard=unnamed

" MacOS backspace fix
set backspace=indent,eol,start
set foldmethod=syntax
set foldlevelstart=99
set smartindent
set tabstop=2
set showtabline=2  " Show tabline
set shiftwidth=2
set expandtab
set lazyredraw

autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:actualvim = 0
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

for s:fpath in split(globpath("~/.vim/scripts", '*.vim'), '\n')
  exe 'source' s:fpath
endfor

set secure
