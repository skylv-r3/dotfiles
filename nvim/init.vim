
if has('win32')
  let g:python3_host_prog=expand('$HOME/python/neovim3/Scripts/python.exe')
  let s:dein_dir = expand('$HOME/AppData/Local/nvim/dein')
else
  let g:python3_host_prog=expand('$HOME/python/neovim3/bin/python')
  let s:dein_dir = expand('$HOME/.cache/nvim/dein')
endif

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" Add the dein installation directory into runtimepath
execute 'set runtimepath+=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

call dein#add(s:dein_dir)
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/defx.nvim')
call dein#add('Shougo/denite.nvim')

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('machakann/vim-highlightedyank')
call dein#add('kana/vim-submode')
call dein#add('tpope/vim-surround')

call dein#add('PProvost/vim-ps1')

call dein#add('mattn/emmet-vim')
call dein#add('mattn/vim-sl')

call dein#add('momota/cisco.vim')

call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" ### Plugin Settings
" prefix
noremap [pluginprefix] <Nop>
nmap <C-c> [pluginprefix]
nmap <C-d> [pluginprefix]

" # AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme = 'jellybeans'
let g:airline_mode_map = {
  \ 'n'  : 'NML',
  \ 'i'  : 'INS',
  \ 'R'  : 'REP',
  \ 'c'  : 'CMD',
  \ 'v'  : 'VSL',
  \ 'V'  : 'V-L',
  \ '' : 'V-B',
  \ }
let g:airline_powerline_fonts = 0

" # Submode
let g:submode_keep_leaving_key = v:true
call submode#enter_with('winsize', 'n', '', '<C-w>>', '10<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '10<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('winsize', 'n', '', '<C-w>_', '<C-w>-')
call submode#map('winsize', 'n', '', '>', '10<C-w>>')
call submode#map('winsize', 'n', '', '<', '10<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>+')
call submode#map('winsize', 'n', '', '_', '<C-w>-')

call submode#enter_with('winselect', 'n', '', '<C-w>h', '<C-w>h')
call submode#enter_with('winselect', 'n', '', '<C-w>j', '<C-w>j')
call submode#enter_with('winselect', 'n', '', '<C-w>k', '<C-w>k')
call submode#enter_with('winselect', 'n', '', '<C-w>l', '<C-w>l')
call submode#map('winselect', 'n', '', 'h', '<C-w>h')
call submode#map('winselect', 'n', '', 'j', '<C-w>j')
call submode#map('winselect', 'n', '', 'k', '<C-w>k')
call submode#map('winselect', 'n', '', 'l', '<C-w>l')

call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
call submode#map('undo/redo', 'n', '', '-', 'g-')
call submode#map('undo/redo', 'n', '', '+', 'g+')

call submode#enter_with('hscroll', 'n', '', 'zl', 'zl')
call submode#enter_with('hscroll', 'n', '', 'zL', 'zL')
call submode#enter_with('hscroll', 'n', '', 'zh', 'zh')
call submode#enter_with('hscroll', 'n', '', 'zH', 'zH')
call submode#map('hscroll', 'n', '', 'l', 'zl')
call submode#map('hscroll', 'n', '', 'L', 'zL')
call submode#map('hscroll', 'n', '', 'h', 'zh')
call submode#map('hscroll', 'n', '', 'H', 'zH')

function! s:xxx()
  undojoin
  normal! "Xx
endfunction
nnoremap <silent> <Plug>(xxx) :<C-u>call <SID>xxx()<CR>
call submode#enter_with('xxx', 'n', '', 'x', '"xx')
call submode#map('xxx', 'n', 'r', 'x', '<Plug>(xxx)')

" # defx
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>  defx#do_action('open')
  nnoremap <silent><buffer><expr> c     defx#do_action('copy')
  nnoremap <silent><buffer><expr> m     defx#do_action('move')
  nnoremap <silent><buffer><expr> p     defx#do_action('paste')
  nnoremap <silent><buffer><expr> l     defx#do_action('open')
  nnoremap <silent><buffer><expr> E     defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P     defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o     defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K     defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N     defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M     defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C     defx#do_action('toggle_columns',
  \ 'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S     defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d     defx#do_action('remove')
  nnoremap <silent><buffer><expr> r     defx#do_action('rename')
  nnoremap <silent><buffer><expr> !     defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x     defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy    defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;     defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h     defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~     defx#do_action('cd')
  nnoremap <silent><buffer><expr> q     defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *     defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j     line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k     line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd    defx#do_action('change_vim_cwd')
  xnoremap <silent><buffer><expr> <CR>  defx#do_action('toggle_select_visual')
  nnoremap <silent><buffer><expr> <Tab> winnr('$') != 1 ?
  \ ':<C-u>wincmd w<CR>' :
  \ ':<C-u>Defx -buffer-name=temp -split=vertical<CR>'

endfunction

noremap <silent> [pluginprefix]<C-z> :Defx <CR>
noremap <silent> [pluginprefix]<C-x> :Defx `expand('%:p:h')` -search=`expand('%:p')` <CR>
noremap <silent> [pluginprefix]<C-v> :Defx -split=vertical -winwidth=50 -direction=topleft <CR>
noremap <silent> [pluginprefix]<C-c> :Defx -split=vertical -winwidth=50 -direction=topleft
  \                                    `expand('%:p:h')` -search=`expand('%:p')` <CR>

" deoplete
let g:deoplete#enable_at_startup = 1

" emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" denite
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d       denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p       denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q       denite#do_map('quit')
  nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-CR>  denite#do_map('do_action', 'tabswitch')
  nnoremap <silent><buffer><expr> <S-CR>  denite#do_map('do_action', 'splitswitch')
  nnoremap <silent><buffer><expr> <C-l>   denite#do_map('do_action', 'vsplitswitch')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
  nnoremap <silent><buffer><expr> <esc>   denite#do_map('quit')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <esc>   <Plug>(denite_filter_quit)
endfunction

noremap [pluginprefix]b :<C-u>Denite buffer -split=floating<CR>
noremap [pluginprefix]h :<C-u>Denite file/old -split=floating<CR>
noremap [pluginprefix]f :<C-u>Denite file/rec -split=floating<CR>
noremap [pluginprefix]d :<C-u>Denite directory_rec -split=floating<CR>
noremap [pluginprefix]c :<C-u>Denite directory_rec -default-action=cd -split=floating<CR>


" ### Edit ###
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set shiftround

" ### Operation ###
noremap 0 $
noremap 1 0
noremap / /\v
cnoremap s/ s/\v
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" tabs
noremap g<C-t> :tabnew<CR>
noremap <C-Tab> gt
noremap <C-S-Tab> gT

" split window
noremap <C-w>- :split<CR>
noremap <C-w><Bar> :vsplit<CR>

" enter command mode without shift
noremap ; :

" reload vimrc
noremap g<C-r> :source $MYVIMRC<CR>

" ### Display ###
set number
set cursorline
set laststatus=2 " default
set cmdheight=1 " default
set ambiwidth=double

set list
set listchars=tab:>_,trail:-,eol:$,extends:},precedes:{,nbsp:+
highlight NonText ctermfg=LightBlue
highlight WhiteSpace ctermfg=LightGreen

" ### Search ###
set incsearch " default
set inccommand=split
set ignorecase
set smartcase
set wrapscan " default
nnoremap <ESC><ESC> :nohlsearch<CR>

" ### Other ###
" complete brackets
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap () ()
inoremap [] []
inoremap {} {}
inoremap '' ''
inoremap "" ""

" number
set nrformats=octal,hex

" modeline
set modeline
set modelines=3

" <Leader>
let mapleader = ","

" Encodings
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,utf-16le,latin1

" cd Desktop
if @% == ""
  let $desktop = expand('$HOME/Desktop')
  cd $desktop
endif

" diff
if &diff
  set diffopt=internal,filler,algorithm:histogram,indent-heuristic
  set nolist
endif

