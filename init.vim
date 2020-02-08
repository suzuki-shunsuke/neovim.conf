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

" Make sure you use single quotes

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kassio/neoterm'
Plug 'itchyny/lightline.vim'
Plug 'mattn/webapi-vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim'
Plug 'tpope/vim-surround'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'altercation/vim-colors-solarized'
" https://mattn.kaoriya.net/software/lang/go/20181217000056.htm
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'natebosch/vim-lsc'
" https://qiita.com/takaakikasai/items/0d617b6e0aed490dff35
Plug 'rickhowe/diffchar.vim'
Plug 'mattn/vim-lsp-settings'

" On-demand loading
Plug 'mattn/vim-goimports', { 'for': 'go' }
" Plug 'zchee/deoplete-jedi', { 'for': 'python' }
" Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
" Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" Plug 'Shougo/deoplete-rct', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'google/vim-jsonnet', { 'for': 'jsonnet' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

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

" disable to switch the mode when select with the mouse
set mouse-=a

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> s
  \ denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> v
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

" Change matchers.
" call denite#custom#source(
" \ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
call denite#custom#source(
\ 'file/rec', 'matchers', ['matcher/cpsm'])

" Change default action.
" call denite#custom#kind('file', 'default_action', 'split')

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
		\ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

function! VsplitTerm()
  vsplit term://zsh
  set nonumber
endfunction

function! SplitTerm()
  split term://zsh
  set nonumber
endfunction

nnoremap ,tv :call VsplitTerm()<cr>
nnoremap ,ts :call SplitTerm()<cr>
nnoremap ,f :Denite file_mru<cr><esc>
" nnoremap ,b :Buffers<cr>
" nnoremap ,l :Files<cr>
" nnoremap ,/ :Ag<cr>
nnoremap ,jq :%!jq '.'<cr>
nnoremap ,g :LspDefinition<cr>
" " nnoremap ,d :Denite -mode=normal directory_mru<cr>
" nnoremap ,g :Denite -mode=normal ghq<cr>

" define the command to reload init.vim
command! R source ~/.config/nvim/init.vim

" require https://github.com/wting/autojump
command! -nargs=1 J exe "cd " . system("jump cd <args>")

" require https://github.com/x-motemen/ghq
" require https://github.com/junegunn/fzf.vim
" https://qiita.com/yysaki/items/fb1cbca8933c6080ebb6
command! -nargs=0 Ghq call fzf#run({
\ 'source': 'ghq list --full-path',
\ 'sink': 'cd'
\ })

" deoplete-jedi
" https://github.com/zchee/deoplete-jedi#options
" let g:deoplete#sources#jedi#python_path = $PYENV_ROOT . '/versions/neovim/bin/python'

" Use deoplete.
" let g:deoplete#enable_at_startup = 1

" deoplete key mapping
" inoremap <silent><expr><Up>     pumvisible() ? "\<C-p>"  : "\<Up>"
" inoremap <silent><expr><Down>   pumvisible() ? "\<C-n>"  : "\<Down>"
" inoremap <silent><expr><Tab>    pumvisible() ? deoplete#close_popup() : "\<Tab>"

" neoterm
" let g:neoterm_position = 'horizontal'
" let g:neoterm_automap_keys = ',tt'

" Ctrl + O : switch the terminal mode to normal mode
" tnoremap <silent> <C-o> <C-\><C-n>
tnoremap <C-w>h <C-\><C-N><C-w>h
tnoremap <C-w>j <C-\><C-N><C-w>j
tnoremap <C-w>k <C-\><C-N><C-w>k
tnoremap <C-w>l <C-\><C-N><C-w>l
tnoremap <C-w>n <C-\><C-n>
tnoremap <C-n> <C-\><C-n>
tnoremap <C-p> <C-\><C-n>Pi
" C-z : to background
" tnoremap <C-z> <C-\><C-N><C-z>
" tnoremap <C-f> <C-\><C-N>:Denite -mode=normal file_mru<cr><esc>
" tnoremap <C-b> <C-\><C-N>:Denite -mode=normal buffer<cr><esc>
" tnoremap <C-d> <C-\><C-N>:Denite -mode=normal directory_mru<cr>
" tnoremap <C-g> <C-\><C-N>:Denite -mode=normal ghq<cr>
" tnoremap <C-u> <C-\><C-N><C-b>

" nnoremap <silent> <f10> :TREPLSendFile<cr>
" nnoremap <silent> <f9> :TREPLSendLine<cr>
" vnoremap <silent> <f9> :TREPLSendSelection<cr>

" command! -nargs=1 -complete=dir Tcd call TBcd("<args>")
" tnoremap <C-i> <C-\><C-N> :Tcd 

" Useful maps
" nnoremap <silent> ,to :Topen<cr>
" nnoremap <silent> ,tt :Ttoggle<cr>
" hide/close terminal
" nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
" nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
" nnoremap <silent> ,tc :call neoterm#kill()<cr>

" Rails commands
" command! Troutes :T rake routes
" command! -nargs=+ Troute :T rake routes | grep <args>
" command! Tmigrate :T rake db:migrate

" Git commands
" command! -nargs=+ Tg :T git <args>

" change the window size
nnoremap <S-Left>  <C-w>><CR>
nnoremap <S-Right> <C-w><<CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
nnoremap <C-p> "*p
inoremap <C-p> <C-r>*
inoremap <C-v> <C-r>*

" gtags
" nnoremap <C-s> :Gtags
" jedi-vim
" let g:jedi#completions_command = '<Tab>'
" let g:jedi#popup_select_first = 0
" let g:jedi#popup_on_dot = 0

" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0

" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif

" let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

" set runtimepath+=~/.config/nvim/neoterm-cd

" typescript
" https://github.com/leafgarland/typescript-vim#indenting
" let g:typescript_indent_disable = 1

" markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1

" diff color settings
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21

" fzf
" set rtp+=/usr/local/opt/fzf

" hcl terraform
let g:terraform_fmt_on_save = 1

" https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Go
" vim-lsp gopls
if executable('gopls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'gopls',
    \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
    \ 'whitelist': ['go'],
    \ })
  " autocmd BufWritePre *.go LspDocumentFormatSync
endif

" go lsp
" https://mattn.kaoriya.net/software/lang/go/20181217000056.htm
let g:lsp_async_completion = 1

" https://github.com/rust-lang/rust.vim
let g:rustfmt_autosave = 1
