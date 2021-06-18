" require https://github.com/x-motemen/ghq
" require https://github.com/junegunn/fzf.vim
" https://qiita.com/yysaki/items/fb1cbca8933c6080ebb6
command! -nargs=0 Ghq call fzf#run({
\ 'source': 'ghq list --full-path',
\ 'sink': 'cd'
\ })

" fzf
" set rtp+=/usr/local/opt/fzf
