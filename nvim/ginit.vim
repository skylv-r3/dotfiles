
" GUI
colorscheme morning
highlight NonText guifg=LightGray guibg=None
highlight WhiteSpace guifg=LightGreen guibg=Orange
GuiFont! 源ノ角ゴシック Code JP M:h10
GuiTabline 0

" use mouse
set mouse=a

" reload vimrc (include ginit.vim)
let $MYGVIMRC = expand(fnamemodify($MYVIMRC, ':h').'/ginit.vim')
noremap g<C-r> :source $MYVIMRC<CR>:source $MYGVIMRC<CR>
