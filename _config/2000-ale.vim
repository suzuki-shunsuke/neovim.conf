nnoremap ,g :ALEGoToDefinition<cr>
nnoremap ,n :ALENextWrap<cr>
nnoremap ,ar :ALEResetBuffer<cr>

 let g:ale_linters = {
      \ 'go': ['gopls', 'gofmt', 'goimports', 'gosimple', 'golangci-lint'],
      \}

let g:ale_go_golangci_lint_package=1
let g:ale_go_langserver_executable = 'gopls'
let g:ale_go_golangci_lint_options = ''
let g:ale_sh_shfmt_options = '-s'

let g:ale_fixers = {
\   'go': ['gofmt', 'goimports'],
\}

let g:ale_fix_on_save = 1
