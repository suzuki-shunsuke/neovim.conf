" " https://github.com/nametake/golangci-lint-langserver#configuration-for-vim-lsp
" augroup vim_lsp_golangci_lint_langserver
"   au!
"   autocmd User lsp_setup call lsp#register_server({
"       \ 'name': 'golangci-lint-langserver',
"       \ 'cmd': {server_info->['golangci-lint-langserver']},
"       \ 'initialization_options': {'command': ['golangci-lint', 'run', '--enable-all', '--disable', 'lll', '--out-format', 'json']},
"       \ 'whitelist': ['go'],
"       \ })
" augroup END
