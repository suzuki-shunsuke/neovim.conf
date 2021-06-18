" nnoremap ,g :LspDefinition<cr>
" 
" " https://budougumi0617.github.io/2020/07/24/make_vimrc_with_lsp/
" function! s:on_lsp_buffer_enabled() abort
"   setlocal omnifunc=lsp#complete
"   setlocal signcolumn=yes
"   nmap <buffer> gd <plug>(lsp-definition)
"   nmap <buffer> <C-]> <plug>(lsp-definition)
"   nmap <buffer> <f2> <plug>(lsp-rename)
"   nmap <buffer> <Leader>d <plug>(lsp-type-definition)
"   nmap <buffer> <Leader>r <plug>(lsp-references)
"   nmap <buffer> <Leader>i <plug>(lsp-implementation)
"   inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
" endfunction
" 
" augroup lsp_install
"   au!
"   autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
" augroup END
" command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')
" 
" let g:lsp_diagnostics_enabled = 1
" let g:lsp_signs_enabled = 1
" let g:lsp_diagnostics_echo_cursor = 1
" " let g:asyncomplete_auto_popup = 1
" " let g:asyncomplete_auto_completeopt = 0
" let g:asyncomplete_popup_delay = 200
" " let g:lsp_text_edit_enabled = 1
" let g:lsp_preview_float = 1
" let g:lsp_diagnostics_float_cursor = 1
" let g:lsp_settings_filetype_go = ['gopls', 'golangci-lint-langserver']
" 
" let g:lsp_settings = {}
" let g:lsp_settings['gopls'] = {
"   \  'workspace_config': {
"   \    'usePlaceholders': v:true,
"   \    'analyses': {
"   \      'fillstruct': v:true,
"   \    },
"   \  },
"   \  'initialization_options': {
"   \    'usePlaceholders': v:true,
"   \    'analyses': {
"   \      'fillstruct': v:true,
"   \    },
"   \  },
"   \}
" 
" " https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Go
" " vim-lsp gopls
" " if executable('gopls')
" "   autocmd BufWritePre *.go LspDocumentFormatSync
" "   " https://github.com/golang/tools/blob/master/gopls/doc/vim.md#vim-lsp
" "   augroup LspGo
" "     au!
" "     autocmd User lsp_setup call lsp#register_server({
" "         \ 'name': 'go-lang',
" "         \ 'cmd': {server_info->['gopls']},
" "         \ 'whitelist': ['go'],
" "         \ })
" "     autocmd FileType go setlocal omnifunc=lsp#complete
" "     "autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
" "     "autocmd FileType go nmap <buffer> ,n <plug>(lsp-next-error)
" "     "autocmd FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
" "   augroup END
" " endif
" 
" " go lsp
" " https://mattn.kaoriya.net/software/lang/go/20181217000056.htm
" " let g:lsp_async_completion = 1
