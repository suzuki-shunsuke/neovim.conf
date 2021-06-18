function! s:breload()
  let l:p = expand("%:p")
  bdelete
  exe "vsplit " . l:p
endfunction

command! Breload call s:breload()

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

" https://github.com/neovim/neovim/issues/11393#issuecomment-634454128
cnoremap 3636 <c-u>undo<CR>

" define the command to reload init.vim
command! R source ~/.config/nvim/init.vim

" require https://github.com/wting/autojump
command! -nargs=1 J exe "cd " . system("jump cd <args>")

nnoremap ,l :Files<cr>
nnoremap ,jq :%!jq '.'<cr>

" Ctrl + O : switch the terminal mode to normal mode
" tnoremap <silent> <C-o> <C-\><C-n>
" tnoremap <C-w>h <C-\><C-N><C-w>h
" tnoremap <C-w>j <C-\><C-N><C-w>j
" tnoremap <C-w>k <C-\><C-N><C-w>k
" tnoremap <C-w>l <C-\><C-N><C-w>l
" tnoremap <C-w>n <C-\><C-n>
tnoremap <C-n> <C-\><C-n>
tnoremap <C-p> <C-\><C-n>Pi
" C-z : to background
" tnoremap <C-z> <C-\><C-N><C-z>

" change the window size
nnoremap <S-Left>  <C-w>><CR>
nnoremap <S-Right> <C-w><<CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
nnoremap <C-p> "*p
inoremap <C-p> <C-r>*
inoremap <C-v> <C-r>*
