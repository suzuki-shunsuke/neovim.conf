if &compatible
  set nocompatible " Be iMproved
endif

augroup MyAutoCmd
  " initializing
  " prevent from duplicate command definition at reloading
  autocmd!
  " when entering buffer on the terminal mode, switch to the terminal mode
  au BufEnter term://* startinsert
augroup END

" pyenv support
" assume that the environment 'neovim' has already been created with pyenv virtualenv
" $ pyenv virtualenv 3.6.1 neovim
" $ pyenv activate neovim
" $ pip install neovim jedi
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim/bin/python'

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/vim-plug')

" https://github.com/dense-analysis/ale#2iii-completion
" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
" let g:ale_completion_enabled = 1

" Make sure you use single quotes

" Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kassio/neoterm'
Plug 'itchyny/lightline.vim'
" Plug 'mattn/webapi-vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim'
Plug 'tpope/vim-surround'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'altercation/vim-colors-solarized'
" https://mattn.kaoriya.net/software/lang/go/20181217000056.htm
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'natebosch/vim-lsc'
" https://qiita.com/takaakikasai/items/0d617b6e0aed490dff35
" Plug 'rickhowe/diffchar.vim'
" Plug 'mattn/vim-lsp-settings'
Plug 'dense-analysis/ale'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" On-demand loading
Plug 'mattn/vim-goimports', { 'for': 'go' }
" Plug 'zchee/deoplete-jedi', { 'for': 'python' }
" Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
" Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" Plug 'Shougo/deoplete-rct', { 'for': 'ruby' }
" Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
" Plug 'google/vim-jsonnet', { 'for': 'jsonnet' }
" Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'Chiel92/vim-autoformat'
Plug 'tsandall/vim-rego'

" Initialize plugin system
call plug#end()

" Required:
filetype plugin indent on
syntax enable

" solarized
set background=dark
colorscheme solarized

" set shiftwidth=4
set number
set ruler
set undofile
set matchpairs& matchpairs+=<:>
set hidden  " allow not to save the buffer before switch the buffer

" diff color settings
" https://qiita.com/takaakikasai/items/b46a0b8c94e476e57e31
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21

" load config
call map(sort(split(globpath(&runtimepath, '_config/*.vim'))), {->[execute('exec "so" v:val')]})
