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

nnoremap ,f :Denite file_mru<cr><esc>
nnoremap ,b :Denite buffer<cr><esc>
nnoremap ,/ :Denite grep<cr>
" nnoremap ,d :Denite -mode=normal directory_mru<cr>
" nnoremap ,g :Denite -mode=normal ghq<cr>

" tnoremap <C-f> <C-\><C-N>:Denite -mode=normal file_mru<cr><esc>
" tnoremap <C-b> <C-\><C-N>:Denite -mode=normal buffer<cr><esc>
" tnoremap <C-d> <C-\><C-N>:Denite -mode=normal directory_mru<cr>
" tnoremap <C-g> <C-\><C-N>:Denite -mode=normal ghq<cr>
