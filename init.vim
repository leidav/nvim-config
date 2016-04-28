call plug#begin()

"statusbar
Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

"auto completion
Plug 'Shougo/deoplete.nvim'

"file viwer
Plug 'scrooloose/nerdtree'

"fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

"delete buffer without closing the window
Plug 'qpkorr/vim-bufkill'

"git
Plug 'tpope/vim-fugitive'

call plug#end()

"show line numbers
set number

"tab settings
set tabstop=4
set softtabstop=0
set shiftwidth=4
set smartindent
set cindent
set cinoptions=(0,u0,U0

"activate true color mode
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

colorscheme  badwolf

"switch z and y on german keyboard
noremap <C-z> <C-y>

"window functions
"resize window
nnoremap <C-Up> <C-W>+
nnoremap <C-Down> <C-W>-
nnoremap <C-Left> <C-W><
nnoremap <C-Right> <C-W>>

"fast window switching
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"fast terminal exit
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

"clang-format
map <C-K> :pyf ~/.vim/clang-format.py<cr>
imap <C-K> <c-o>:pyf ~/.vim/clang-format.py<cr>

"NerdCree
map <silent><C-n> :NERDTreeToggle<CR>

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"deoplete
let g:deoplete#enable_at_startup = 1
"inoremap<silent><expr><C-Space> deoplete#mappings#manual_complete()
